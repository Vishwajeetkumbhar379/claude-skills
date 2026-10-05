#!/usr/bin/env bash
# One-shot installer for OmniRoute + FreeLLMAPI on a Claude Code cloud container
# (or any Linux box without Docker). Re-running is safe.
#   OmniRoute  -> http://localhost:20128   (dashboard + OpenAI API at /v1)
#   FreeLLMAPI -> http://localhost:3001    (dashboard + OpenAI API at /v1)
set -euo pipefail

BASE="${BASE:-$HOME}"
NODE_DIR=/opt/node24

# 1. Node 24 (OmniRoute needs >=22.22.2; FreeLLMAPI needs <25)
if ! "$NODE_DIR/bin/node" -v 2>/dev/null | grep -q '^v24\.'; then
  V=$(curl -fsSL https://nodejs.org/dist/latest-v24.x/ | grep -oE 'node-v24\.[0-9.]+-linux-x64\.tar\.xz' | head -1)
  curl -fsSL "https://nodejs.org/dist/latest-v24.x/$V" -o "/tmp/$V"
  mkdir -p "$NODE_DIR" && tar -xJf "/tmp/$V" -C "$NODE_DIR" --strip-components=1
fi
export PATH="$NODE_DIR/bin:$PATH"
echo "node $(node -v), npm $(npm -v)"

# 2. OmniRoute (published npm package; allow its native/postinstall scripts)
npm install -g --allow-scripts=omniroute,keytar,@parcel/watcher,@swc/core,esbuild,better-sqlite3 omniroute

# 3. FreeLLMAPI (build from source)
if [ ! -d "$BASE/freellmapi" ]; then
  git clone --depth 1 https://github.com/tashfeenahmed/freellmapi "$BASE/freellmapi"
fi
cd "$BASE/freellmapi"
# The upstream lockfile pins some tarballs to registry.npmmirror.com, which
# sandboxed networks often block -> npm hangs. Point them at the npm registry.
sed -i 's#https://registry.npmmirror.com/#https://registry.npmjs.org/#g' package-lock.json
npm install
npm rebuild better-sqlite3          # native addon is skipped by npm 11 script policy
if [ ! -f .env ]; then
  KEY=$(node -e 'console.log(require("crypto").randomBytes(32).toString("hex"))')
  printf "ENCRYPTION_KEY=%s\nPORT=3001\nREQUEST_ANALYTICS_RETENTION_DAYS=90\nREQUEST_ANALYTICS_MAX_ROWS=100000\n" "$KEY" > .env
fi
npm run build

# 4. Start both in the background
omniroute stop >/dev/null 2>&1 || true
fuser -k 3001/tcp >/dev/null 2>&1 || true
sleep 2
# Start OmniRoute from its own dir: it reads ./.env, and FreeLLMAPI's .env sets PORT=3001.
mkdir -p "$BASE/omniroute-run"
(cd "$BASE/omniroute-run" && PORT=20128 nohup omniroute > "$BASE/omniroute.log" 2>&1 &)
(cd "$BASE/freellmapi" && NODE_ENV=production nohup node server/dist/index.js > "$BASE/freellmapi.log" 2>&1 &)

for port in 20128 3001; do
  for _ in $(seq 1 40); do curl -s -o /dev/null "http://localhost:$port/" && break; sleep 2; done
  echo "port $port -> HTTP $(curl -s -o /dev/null -w '%{http_code}' "http://localhost:$port/")"
done
grep -m1 'First-run setup code' "$BASE/freellmapi.log" || true
echo "Logs: $BASE/omniroute.log  $BASE/freellmapi.log"
