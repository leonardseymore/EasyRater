//
//  EasyRaterAppDelegate.h
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/26.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusMenuController.h"
#import "ITunesController.h"

@interface EasyRaterAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) StatusMenuController *statusMenuController;
@property (nonatomic, strong) ITunesController *iTunesController;

@end
