//
//  StatusMenuController.h
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/28.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ITunesController.h"

@interface StatusMenuController : NSViewController

@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
@property (nonatomic, strong) TrackViewController *trackViewController;
@property (nonatomic, strong) ITunesController *iTunesController;
@property (nonatomic, strong) iTunesTrack *track;

@property (strong) IBOutlet NSMenu *menuStatus;
@property (weak) IBOutlet NSMenuItem *menuItemPreview;
@property (weak) IBOutlet NSMenuItem *menuItemUnknown;
@property (weak) IBOutlet NSMenuItem *menuItem1;
@property (weak) IBOutlet NSMenuItem *menuItem2;
@property (weak) IBOutlet NSMenuItem *menuItem3;
@property (weak) IBOutlet NSMenuItem *menuItem4;
@property (weak) IBOutlet NSMenuItem *menuItem5;
@property (nonatomic, strong) NSArray *ratingMenuItems;


- (IBAction)menuItemDeleteAction:(id)sender;
- (IBAction)menuItemUnkownAction:(id)sender;
- (IBAction)menuItem1Action:(id)sender;
- (IBAction)menuItem2Action:(id)sender;
- (IBAction)menuItem3Action:(id)sender;
- (IBAction)menuItem4Action:(id)sender;
- (IBAction)menuItem5Action:(id)sender;

@end
