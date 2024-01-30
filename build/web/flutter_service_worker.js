'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "8b52df9efd2998d0a7c2f8f4b14fa0c8",
"assets/AssetManifest.bin.json": "197a494a8f0b4d3ca3b0a79c484d5ac3",
"assets/AssetManifest.json": "17acaf7a4ba0423c319231b9f2be87c4",
"assets/assets/icons/all_categories.svg": "24865ef88423d27c848b894af36da77c",
"assets/assets/icons/cash.svg": "59a2ead483c3c7f6b6c0958b837a5de1",
"assets/assets/icons/dashboard.svg": "87621a980c790e7c2b6a5221bcaae3fb",
"assets/assets/icons/debit.svg": "b70addaca80ee1c8453efa98aa134b5b",
"assets/assets/icons/delete.svg": "48a6a1d42b9c57afc0ee5022e106c8da",
"assets/assets/icons/done.svg": "7bb1f674056b30e9d99482088d6962cd",
"assets/assets/icons/drink.svg": "161440b8cd9393233b67b8c9ed02aa9f",
"assets/assets/icons/food.svg": "584d3acb1b2260c6de8d12d19cb18188",
"assets/assets/icons/history.svg": "dd1b245655b4b700b7035056c07c3e34",
"assets/assets/icons/home.svg": "51dc3894347e5dc318af6b04c9a0570e",
"assets/assets/icons/image.svg": "ae684c10c910db958ca3268437ada3ba",
"assets/assets/icons/instagram.png": "9aefd702f146208c698329fc41d1c1ee",
"assets/assets/icons/orders.svg": "1448860c0561016affbba3209aefbe6e",
"assets/assets/icons/payments.svg": "d86575f878d15b5dfb1c7c07ab669a2c",
"assets/assets/icons/print.svg": "0fd65699a30583279bce589ee7cdf6a1",
"assets/assets/icons/qr_code.svg": "8addd647769d62a5e5eb1485eb93009e",
"assets/assets/icons/snack.svg": "4a2db04a67fe239d461289d0bf03f6de",
"assets/assets/images/f1.jpeg": "8405aed26425f858a2244aa6b781aa3b",
"assets/assets/images/f2.jpeg": "751d18f43cf2dfcbf3c43c6fa17d018a",
"assets/assets/images/f3.jpeg": "6e0730d47716b0ca6a16970a49006713",
"assets/assets/images/f4.jpeg": "a8ae874b4273846bf28900a09d7de48b",
"assets/assets/images/f5.jpeg": "bb1972d36ac2fcb872523e9fba3b698d",
"assets/assets/images/f6.jpeg": "7c5e8e1f3bf89012b1ea9e82c4a413fb",
"assets/assets/images/f7.jpeg": "84c588c595fc830461cd21249a732b2b",
"assets/assets/images/f8.jpeg": "e81bc496cb9c2b98a2ce91b6a0ac2cc0",
"assets/assets/images/logo.png": "385e36bf15f8225d7cf786e8a82c7d32",
"assets/assets/images/manage_printer.png": "874c84eb70e27861208417f3582794c0",
"assets/assets/images/manage_printers%2520-%2520unused.png": "90604290519e0c0a8cf12f792650cea1",
"assets/assets/images/manage_printerx.png": "233f8dd7f347300bc4815a2285db8692",
"assets/assets/images/manage_product-unused.png": "c58e941cff4bff765d4d1d662a6891f9",
"assets/assets/images/manage_product.png": "05c7eb549ee123bebbdabf3b91dc2dc7",
"assets/assets/images/save_key.png": "4156076d6ded8aa98d30423a0ed1eb79",
"assets/assets/images/sync_data.png": "6583470504c2d13cf305f51b622ca090",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95cbbaa6ff6d678d6dd596ee664447db",
"assets/NOTICES": "10a84a2b5716f7b182eb79fdcfcd9669",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/esc_pos_utils_plus/resources/capabilities.json": "03d6ac67d01a1c0881bc2f462e7935d6",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e2c221eb1f6c485db251376316c7808a",
"/": "e2c221eb1f6c485db251376316c7808a",
"main.dart.js": "1dc78393a3f40cdf9e477817f2a4be59",
"manifest.json": "e2a0d46e056afb99da8b87932fac796d",
"version.json": "83a4dfee5669a6505278d1fa7e062262"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
