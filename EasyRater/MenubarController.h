#define STATUS_ITEM_VIEW_WIDTH 24.0

//
//  MenubarController.h
//  StatusBarTest
//
//  Created by Leonard Seymore on 2012/04/13.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesController.h"
#import "iTunes.h"

@interface MenubarController : NSObject

@property (nonatomic, strong, readonly) NSStatusItem *statusItem;

@property (nonatomic, strong) ITunesController *iTunesController;
@property (nonatomic, strong) NSMenu *ratingMenu;
@property (nonatomic, strong) NSMenuItem *menuItemUnknown;
@property (nonatomic, strong) NSMenuItem *menuItem1;
@property (nonatomic, strong) NSMenuItem *menuItem2;
@property (nonatomic, strong) NSMenuItem *menuItem3;
@property (nonatomic, strong) NSMenuItem *menuItem4;
@property (nonatomic, strong) NSMenuItem *menuItem5;
@property (nonatomic, strong) NSMenuItem *menuItemDelete;
@property (nonatomic, strong) NSArray *ratingMenuItems;
@property (nonatomic, strong) iTunesTrack *track;

- (id) initWithITunesController:(ITunesController*) iTunesController;
@end
