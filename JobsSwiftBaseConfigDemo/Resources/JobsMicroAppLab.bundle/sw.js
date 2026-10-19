// HTTPS/localhost 模式才执行；仅管理本学习包的缓存前缀，不清理同源其它应用缓存。
const PREFIX = 'jobs-micro-lab-';
const CACHE = PREFIX + 'v1';
const ASSETS = ['./', './index.html', './manifest.webmanifest'];
const SHELL = ASSETS.map(path => new URL(path, self.registration.scope).href);
self.addEventListener('install', event => {
  event.waitUntil(caches.open(CACHE).then(cache => cache.addAll(ASSETS)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', event => {
  event.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(key => key.startsWith(PREFIX) && key !== CACHE).map(key => caches.delete(key)))).then(() => self.clients.claim()));
});
self.addEventListener('fetch', event => {
  const request = event.request;
  const url = new URL(request.url);
  if (request.method !== 'GET' || url.origin !== self.location.origin || !SHELL.includes(url.href)) return;
  // 学习最小策略：联网成功更新缓存，断网从 cache 取同一个资源，导航缺省回到已缓存入口。
  event.respondWith(fetch(request).then(response => {
    if (response.ok && response.type === 'basic') {
      const copy = response.clone();
      event.waitUntil(caches.open(CACHE).then(cache => cache.put(request, copy)));
    }
    return response;
  }).catch(async () => {
    const cache = await caches.open(CACHE);
    const cached = await cache.match(request);
    if (cached) return cached;
    if (request.mode === 'navigate') return (await cache.match(new URL('./index.html', self.registration.scope).href)) || Response.error();
    return Response.error();
  }));
});
