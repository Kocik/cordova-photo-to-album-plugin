# PhotoToAlbum
## Apache Cordova plugin for iOS
**Note** This is an old pice of code that I wrote while working on a mobile app in 2014. This repo servs mostly as and archive.

###Usage:
Install plugin
    
    cordova plugin add https://github.com/Kocik/cordova-photo-to-album-plugin/
In your javascript add:
		
		window.plugins.phototoalbum.download(url, successCallback, failCallback);

_This works for iOS, in Android I see in my old code that I used the following:_
    
    window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, fileSystemSuccess, fileSystemFail);
		
    function fileSystemSuccess(fileSystem) {
        var directoryEntry = fileSystem.root; // to get root path to directory
        directoryEntry.getDirectory('YOUR_DIR_HERE', {create: true, exclusive: false}, onDirectorySuccess, onDirectoryFail);
        var rootdir = fileSystem.root;
        var fp = rootdir.toURL();
        fp = fp+"/YOUR_DIR_HERE/"+file_name;
        var fileTransfer = new FileTransfer();
        fileTransfer.download(
          encodeURI(URL_TO_DOWNLOAD),fp,  
          function(entry) {
            alert("File downloaded to: " + entry.fullPath);
          },
          function(error) {
    			  alert('Something went wrong. Try again later.')
          }
        );
    }

This will save the photo, but will appear in the gallery only after it's refreshed, so probably after the phone is restarted.