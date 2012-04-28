//
//  ITunesController.m
//  StatusBarTest
//
//  Created by Leonard Seymore on 2012/04/13.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "ITunesController.h"

@implementation ITunesController

@synthesize iTunesApp = _iTunesApp;
@synthesize deleteTrackViewController = _deleteTrackViewController;

-(id)init
{
    self = [super init];
    _deleteTrackViewController = [[DeleteTrackViewController alloc] init];
    _iTunesApp = (iTunesApplication *)[SBApplication applicationWithBundleIdentifier:@"com.apple.iTunes"];
    return self;
}

-(void) dealloc
{
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
    self.iTunesApp = nil;
}

-(void) setTrackRating:(iTunesTrack*)track:(NSInteger) rating
{    
    if (track) {
        [track setRating:rating];
        NSLog(@"Set rating");
    }
}

-(void) deleteTrack:(iTunesTrack*)track
{
    if (track) {
        NSString *alertMessage = [[NSString alloc] initWithFormat:NSLocalizedString(@"Track Delete Prompt", @"Prompt format for confirming if track should be deleted")];
        NSAlert *alert = [NSAlert alertWithMessageText:alertMessage defaultButton:NSLocalizedString(@"Delete Track", @"Title for delete track button") alternateButton:NSLocalizedString(@"Cancel", @"Title for cancel button") otherButton:nil informativeTextWithFormat:NSLocalizedString(@"Track Delete No-Restore Warning", @"Warn user that deleted tracks cannot be restored")];
        
        [alert setAccessoryView:_deleteTrackViewController.view];
        [_deleteTrackViewController setTrack:track];
        
        if ([alert runModal] == NSAlertDefaultReturn) {
            [track delete];
            NSLog(@"Deleted item");
        }
    }
}

-(iTunesTrack *) currentTrack
{
    if (![_iTunesApp isRunning]) {
        return nil;
    }
    
    iTunesTrack *track = [self.iTunesApp currentTrack];
    return [track get];
}
@end
