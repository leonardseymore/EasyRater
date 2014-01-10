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
@synthesize trackViewController = _trackViewController;
@synthesize track = _track;
@synthesize menuStatus = _menuStatus;
@synthesize menuStatusNoTrack = _menuStatusNoTrack;
@synthesize menuItemPreview = _menuItemPreview;
@synthesize menuItemUnknown = _menuItemUnknown;
@synthesize menuItem1 = _menuItem1;
@synthesize menuItem2 = _menuItem2;
@synthesize menuItem3 = _menuItem3;
@synthesize menuItem4 = _menuItem4;
@synthesize menuItem5 = _menuItem5;
@synthesize menuItemBuy = _menuItemBuy;
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
        _ratingMenuItems = [NSArray arrayWithObjects:_menuItemUnknown, _menuItem1, _menuItem2, _menuItem3, _menuItem4, _menuItem5, nil];
        
        _trackViewController = [[TrackViewController alloc]init];
        [_menuItemPreview setView:[_trackViewController view]];
    }
    #ifndef LITE
    [_menuItemBuy setHidden:YES];
    #endif
    return self;
}

- (void) dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:_statusItem];
}

- (void) setTrack : (iTunesTrack*)newTrack
{
    [_trackViewController setTrack:newTrack];
    if (newTrack) {
        if ([_statusItem menu] == _menuStatusNoTrack) {
            [_menuStatusNoTrack cancelTrackingWithoutAnimation];
        }
        [_statusItem setMenu:_menuStatus];
        [_statusItem setToolTip:[[NSString alloc] initWithFormat:NSLocalizedString(@"Track Information", @"Format for track information"), [newTrack artist], [newTrack album] , [newTrack name]]];
        NSInteger currentRating = [newTrack rating];
        int starRating = (int)currentRating / 20;
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
        if ([_statusItem menu] == _menuStatus) {
            [_menuStatus cancelTrackingWithoutAnimation];
        }
        [_statusItem setMenu:_menuStatusNoTrack];
        [_statusItem setToolTip:NSLocalizedString(@"No Track Playing", @"Indicates that no iTunes track is currently playing")];
        [_statusItem setImage:[NSImage imageNamed:@"ratingStarNoTrack"]];
        [_statusItem setAlternateImage:[NSImage imageNamed:@"ratingStarNoTrackAlt"]];
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

- (IBAction)menuItemBuyAction:(id)sender {
    NSString *baseUrl = @"http://lorc.biz/easyrater/test.html?";
   
    NSString *umtSource = @"utm_source=application";
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *umtMedium = @"&utm_medium=easyraterlite-";
    umtMedium = [umtMedium stringByAppendingString:version];
    umtMedium = [umtMedium stringByAppendingString:@"-buy"];
    NSString *umtCampaign = @"&utm_campaign=product";
    
    NSString *url = [baseUrl stringByAppendingString:umtSource];
    url = [url stringByAppendingString:umtMedium];
    url = [url stringByAppendingString:umtCampaign];
    
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
}
@end
