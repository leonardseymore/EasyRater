//
//  MenubarController.m
//  StatusBarTest
//
//  Created by Leonard Seymore on 2012/04/13.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "MenubarController.h"
#import "ITunesController.h"

@implementation MenubarController

@synthesize statusItem = _statusItem;
@synthesize menuItemUnknown = _menuItemUnknown;
@synthesize menuItem1 = _menuItem1;
@synthesize menuItem2 = _menuItem2;
@synthesize menuItem3 = _menuItem3;
@synthesize menuItem4 = _menuItem4;
@synthesize menuItem5 = _menuItem5;
@synthesize menuItemDelete = _menuItemDelete;
@synthesize ratingMenu = _ratingMenu;
@synthesize ratingMenuItems = _ratingMenuItems;
@synthesize iTunesController = _iTunesController;
@synthesize track = _track;


- (id) initWithITunesController:(ITunesController*) iTunesController
{
    self = [super init];
    
    if (self != nil) 
    {
        _iTunesController = iTunesController;
         _ratingMenu = [[NSMenu allocWithZone:[NSMenu menuZone]] initWithTitle:@"Rating"];  
        
        _menuItemDelete = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:NSLocalizedString(@"Delete", @"Indicates action to delete track") action:@selector(menuItemDeleteAction:) keyEquivalent:@""];
        [_menuItemDelete setTarget:self];
        [_ratingMenu addItem:_menuItemDelete];
        
        _menuItemUnknown = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:NSLocalizedString(@"None", @"Indicates a track that is not rated") action:@selector(menuItemActionUnknown:) keyEquivalent:@""];
        [_menuItemUnknown setTarget:self];
        [_ratingMenu addItem:_menuItemUnknown];
        
        _menuItem1 = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"★" action:@selector(menuItemAction1:) keyEquivalent:@""];
        [_menuItem1 setTarget:self];
        [_ratingMenu addItem:_menuItem1];
        
        _menuItem2 = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"★★" action:@selector(menuItemAction2:)  keyEquivalent:@""];
        [_menuItem2 setTarget:self];
        [_ratingMenu addItem:_menuItem2];
        
        _menuItem3 = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"★★★" action:@selector(menuItemAction3:) keyEquivalent:@""];
        [_menuItem3 setTarget:self];
        [_ratingMenu addItem:_menuItem3];
        
        _menuItem4 = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"★★★★" action:@selector(menuItemAction4:) keyEquivalent:@""];
        [_menuItem4 setTarget:self];
        [_ratingMenu addItem:_menuItem4];
        
        _menuItem5 = [[NSMenuItem allocWithZone:[NSMenu menuZone]] initWithTitle:@"★★★★★" action:@selector(menuItemAction5:) keyEquivalent:@""];
        [_menuItem5 setTarget:self];
        [_ratingMenu addItem:_menuItem5];
    
        _ratingMenuItems = [NSArray arrayWithObjects:_menuItemUnknown, _menuItem1, _menuItem2, _menuItem3, _menuItem4, _menuItem5, nil];
        
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        [_statusItem setImage:[NSImage imageNamed:@"ratingStarUnknown"]];
        [_statusItem setAlternateImage:[NSImage imageNamed:@"ratingStarUnknownAlt"]];
        [_statusItem setHighlightMode:TRUE];
        [_statusItem setMenu:_ratingMenu];
    }
    return self;
}

-(void)menuItemAction5:(id)sender {
    [_iTunesController setTrackRating:_track:100];
}

-(void)menuItemAction4:(id)sender {
    [_iTunesController setTrackRating:_track:80];
}


-(void)menuItemAction3:(id)sender {
    [_iTunesController setTrackRating:_track:60];
}


-(void)menuItemAction2:(id)sender {
    [_iTunesController setTrackRating:_track:40];
}


-(void)menuItemAction1:(id)sender {
    [_iTunesController setTrackRating:_track:20];
}

-(void)menuItemActionUnknown:(id)sender {
    [_iTunesController setTrackRating:_track:0];
}


-(void)menuItemDeleteAction:(id)sender {
    [_iTunesController deleteTrack:_track];
}

- (void) dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
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

@end
