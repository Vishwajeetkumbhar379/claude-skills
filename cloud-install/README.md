# OmniRoute + FreeLLMAPI on a cloud container

Installs and starts both AI routers without Docker or a laptop:

| App | URL | OpenAI-compatible API |
|---|---|---|
| [OmniRoute](https://github.com/diegosouzapw/OmniRoute) | http://localhost:20128 | `http://localhost:20128/v1` |
| [FreeLLMAPI](https://github.com/tashfeenahmed/freellmapi) | http://localhost:3001 | `http://localhost:3001/v1` |

## Run

In a Claude Code cloud session, ask Claude: *"run cloud-install/install.sh"*, or run:

```bash
bash cloud-install/install.sh
```

It installs Node 24 to `/opt/node24`, installs OmniRoute from npm, and builds
FreeLLMAPI from source into `~/freellmapi`. It then starts both apps in the background. You can run it again safely.
Logs are written to `~/omniroute.log` and `~/freellmapi.log`. FreeLLMAPI prints a one-time
**First-run setup code** to its log, which you use to create the admin account.

## Fixes applied versus the upstream instructions

- **Node version:** OmniRoute requires Node ≥ 22.22.2 and FreeLLMAPI requires Node < 25, so the script uses Node 24.
- **Skipped install scripts:** npm 11 skips package install scripts, so the native addons (better-sqlite3 and others) are
  explicitly allowed or rebuilt. Without this you get the error `Could not locate the bindings file`.
- **Blocked npm mirror:** FreeLLMAPI's `package-lock.json` points some packages at `registry.npmmirror.com`,
  which restricted networks block, and `npm install` then hangs. The script rewrites those URLs to `registry.npmjs.org`.
- **Port clash:** OmniRoute reads `./.env` from the folder it starts in. It is therefore started from its own folder with `PORT=20128`
  so that it does not take FreeLLMAPI's port 3001.

## Notes

- The cloud container is temporary, so the servers stop when the session ends. For an always-on
  setup, deploy them to a host such as Fly.io (OmniRoute includes a `fly.toml`), Railway or Render.
- Provider calls need outbound network access to the provider hosts (e.g. `opencode.ai`,
  `api.groq.com`, `generativelanguage.googleapis.com`). In a Claude Code cloud environment, set the
  environment's network access to *Full*, or add those hosts to its allowlist.
