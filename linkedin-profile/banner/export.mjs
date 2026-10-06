// Renders banner.html to PNG with headless Chromium (Playwright).
// Usage: node export.mjs [dir=A] [out=../vish-linkedin-cover-1584x396.png] [guides=0]
import { createRequire } from 'node:module';
const { chromium } = createRequire(import.meta.url)('playwright');   // npm i playwright (or set NODE_PATH to a global install)
import http from 'node:http'; import fs from 'node:fs'; import path from 'node:path'; import url from 'node:url';
const here = path.dirname(url.fileURLToPath(import.meta.url));
const [dir='A', out=path.join(here,'..','vish-linkedin-cover-1584x396.png'), guides='0', ss='1'] = process.argv.slice(2);   // ss=1 gives exactly 1584 x 396
const types = {'.html':'text/html','.js':'text/javascript','.woff2':'font/woff2','.mjs':'text/javascript'};
const srv = http.createServer((q,r)=>{ const f=path.join(here, decodeURIComponent(q.url.split('?')[0])); 
  if(!fs.existsSync(f)||fs.statSync(f).isDirectory()){r.writeHead(404);return r.end();}
  r.writeHead(200,{'content-type':types[path.extname(f)]||'application/octet-stream'}); fs.createReadStream(f).pipe(r); });
await new Promise(r=>srv.listen(0,r)); const port = srv.address().port;
const b = await chromium.launch({args:['--use-gl=angle','--use-angle=swiftshader','--enable-unsafe-swiftshader','--ignore-gpu-blocklist']});
const p = await b.newPage({viewport:{width:1584,height:396}, deviceScaleFactor:Number(ss)});
p.on('pageerror',e=>console.error('page error:',e.message)); p.on('console',m=>{ if(m.type()==='error') console.error('console:',m.text()); });
await p.goto(`http://localhost:${port}/banner.html?dir=${dir}&ss=${ss}${guides==='1'?'&guides=1':''}`);
await p.waitForSelector('body[data-ready="1"]',{timeout:60000});
await p.locator('#cover').screenshot({path: out});
await b.close(); srv.close(); console.log('wrote', out);
