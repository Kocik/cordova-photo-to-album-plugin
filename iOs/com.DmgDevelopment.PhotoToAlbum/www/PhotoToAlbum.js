function PhotoToAlbum() {
}

PhotoToAlbum.prototype.download = function (url, successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "PhotoToAlbum", "download", [url]);
};

PhotoToAlbum.install = function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.phototoalbum = new PhotoToAlbum();
  return window.plugins.phototoalbum;
};

cordova.addConstructor(PhotoToAlbum.install);