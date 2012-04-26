//
//  EasyRaterAppDelegate.m
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/26.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "EasyRaterAppDelegate.h"

@implementation EasyRaterAppDelegate

@synthesize menubarController = _menubarController;
@synthesize iTunesController = _iTunesController;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    self.iTunesController = [[ITunesController alloc] init];
    self.menubarController = [[MenubarController alloc] initWithITunesController:self.iTunesController];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self
                                                        selector:@selector(allDistributedNotifications:)
                                                            name:@"com.apple.iTunes.playerInfo"
                                                          object:@"com.apple.iTunes.player"];
    [_menubarController setTrack:[_iTunesController currentTrack]];
}

- (void) allDistributedNotifications:(NSNotification *)note {
    [_menubarController setTrack:[_iTunesController currentTrack]];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    self.iTunesController = nil;
    self.menubarController = nil;
    return NSTerminateNow;
}

@end
