//
//  EasyRaterAppDelegate.h
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/26.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MenubarController.h"
#import "ITunesController.h"

@interface EasyRaterAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MenubarController *menubarController;
@property (nonatomic, strong) ITunesController *iTunesController;

@end
