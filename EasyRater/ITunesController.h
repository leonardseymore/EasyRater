//
//  ITunesController.h
//  StatusBarTest
//
//  Created by Leonard Seymore on 2012/04/13.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iTunes.h"
#import "DeleteTrackViewController.h"

@interface ITunesController : NSObject 

@property (nonatomic, strong) iTunesApplication *iTunesApp;
@property (nonatomic, strong) DeleteTrackViewController *deleteTrackViewController;

-(void) setTrackRating:(iTunesTrack*)track:(NSInteger)rating;
-(void) deleteTrack:(iTunesTrack*)track;

-(iTunesTrack *) currentTrack;
@end
