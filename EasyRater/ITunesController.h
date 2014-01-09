//
//  ITunesController.h
//  StatusBarTest
//
//  Created by Leonard Seymore on 2012/04/13.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iTunes.h"
#import "TrackViewController.h"

@interface ITunesController : NSObject 

@property (nonatomic, strong) iTunesApplication *iTunesApp;
@property (nonatomic, strong) TrackViewController *trackViewController;

-(void) setTrackRating:(iTunesTrack*)track :(NSInteger)rating;
-(void) deleteTrack:(iTunesTrack*)track;
-(void) startiTunes;
-(iTunesTrack *) currentTrack;
@end
