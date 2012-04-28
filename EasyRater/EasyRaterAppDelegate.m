//
//  EasyRaterAppDelegate.m
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/26.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "EasyRaterAppDelegate.h"

@implementation EasyRaterAppDelegate

@synthesize statusMenuController = _statusMenuController;
@synthesize iTunesController = _iTunesController;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    _iTunesController = [[ITunesController alloc] init];
    _statusMenuController = [[StatusMenuController alloc] init];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(allDistributedNotifications:)
                                                            name:@"com.apple.iTunes.playerInfo"
                                                          object:@"com.apple.iTunes.player"];
    [_statusMenuController setTrack:[_iTunesController currentTrack]];
}

- (void) allDistributedNotifications:(NSNotification *)note {
    [_statusMenuController setTrack:[_iTunesController currentTrack]];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    _iTunesController = nil;
    _statusMenuController = nil;
    return NSTerminateNow;
}

@end
