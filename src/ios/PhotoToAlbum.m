#import "SocialSharing.h"
#import <Cordova/CDV.h>
#import <PhotoToAlbum/PhotoToAlbum.h>
#import <Foundation/NSException.h>
#import <MessageUI/MFMessageComposeViewController.h>

@implementation PhotoToAlbum

- (void)download:(CDVInvokedUrlCommand*)command{
		NSString* url = [command.arguments objectAtIndex:0];
        if (url != nil && [url length] > 0) {
	    // Check command.arguments here.
        [self.commandDelegate runInBackground:^{
            NSString* payload = nil;
			
			UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
			UIImageWriteToSavedPhotosAlbum(*image, nil, nil, nil);
			
            // Some blocking logic...
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:payload];
            // The sendPluginResult method is thread-safe.
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
	}

	
}

@end