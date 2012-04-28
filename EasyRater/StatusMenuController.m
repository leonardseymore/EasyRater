//
//  StatusMenuController.m
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/28.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "StatusMenuController.h"

@interface StatusMenuController ()

@end

@implementation StatusMenuController
@synthesize statusItem = _statusItem;
@synthesize iTunesController = _iTunesController;
@synthesize track = _track;
@synthesize menuStatus = _menuStatus;
@synthesize menuItemUnknown = _menuItemUnknown;
@synthesize menuItem1 = _menuItem1;
@synthesize menuItem2 = _menuItem2;
@synthesize menuItem3 = _menuItem3;
@synthesize menuItem4 = _menuItem4;
@synthesize menuItem5 = _menuItem5;
@synthesize ratingMenuItems = _ratingMenuItems;

- (id)init
{
    self = [super initWithNibName:@"StatusMenuView" bundle:nil];
    if (self) {
        [super loadView];
        _iTunesController = [[ITunesController alloc] init];
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:24];
        [_statusItem setImage:[NSImage imageNamed:@"ratingStarUnknown"]];
        [_statusItem setAlternateImage:[NSImage imageNamed:@"ratingStarUnknownAlt"]];
        [_statusItem setHighlightMode:TRUE];
        [_statusItem setMenu:_menuStatus];   
        _ratingMenuItems = [NSArray arrayWithObjects:_menuItemUnknown, _menuItem1, _menuItem2, _menuItem3, _menuItem4, _menuItem5, nil];
    }
    return self;
}

- (void) dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:_statusItem];
}

- (void) setTrack : (iTunesTrack*)newTrack
{
    if (newTrack) {
        [_statusItem setEnabled:TRUE];
        [_statusItem setToolTip:[[NSString alloc] initWithFormat:NSLocalizedString(@"Track Information", @"Format for track information"), [newTrack artist], [newTrack album] , [newTrack name]]];
        NSInteger currentRating = [newTrack rating];
        int starRating = currentRating / 20;
        if (starRating == 0) {
            [_statusItem setImage:[NSImage imageNamed:@"ratingStarUnknown"]];
            [_statusItem setAlternateImage:[NSImage imageNamed:@"ratingStarUnknownAlt"]];
        } else {
            [_statusItem setImage:[NSImage imageNamed:[[NSString alloc] initWithFormat:@"ratingStar%d", starRating]]];
            [_statusItem setAlternateImage:[NSImage imageNamed:[[NSString alloc] initWithFormat:@"ratingStar%dAlt", starRating]]];
        }
        
        for (NSMenuItem *menuItem in _ratingMenuItems) {
            [menuItem setState:NSOffState];
        }
        [[_ratingMenuItems objectAtIndex:starRating] setState:NSOnState];
    } else {
        [_statusItem setEnabled:FALSE];
        [_statusItem setToolTip:NSLocalizedString(@"No Track Playing", @"Indicates that no iTunes track is currently playing")];
        [_statusItem setImage:[NSImage imageNamed:@"ratingStarUnknown"]];
        [_statusItem setAlternateImage:[NSImage imageNamed:@"ratingStarUnknownAlt"]];
    }
    _track = newTrack;
    
}
- (IBAction)menuItemDeleteAction:(id)sender {
    [_iTunesController deleteTrack:_track];
}

- (IBAction)menuItemUnkownAction:(id)sender {
    [_iTunesController setTrackRating:_track:0];
}

- (IBAction)menuItem1Action:(id)sender {
    [_iTunesController setTrackRating:_track:20];
}

- (IBAction)menuItem2Action:(id)sender {
    [_iTunesController setTrackRating:_track:40];
}

- (IBAction)menuItem3Action:(id)sender {
    [_iTunesController setTrackRating:_track:60];
}

- (IBAction)menuItem4Action:(id)sender {
    [_iTunesController setTrackRating:_track:80];
}

- (IBAction)menuItem5Action:(id)sender {
    [_iTunesController setTrackRating:_track:100];
}
@end
