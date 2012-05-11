//
//  DeleteTrackViewController.h
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/27.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunes.h"

@interface TrackViewController : NSViewController
@property (weak) IBOutlet NSImageView *vwArtwork;
@property (weak) IBOutlet NSTextField *lblAlbum;
@property (weak) IBOutlet NSTextField *lblArtist;
@property (weak) IBOutlet NSTextField *lblTrack;
@property (weak) IBOutlet NSTextField *lblPlays;
@property (nonatomic, strong) iTunesTrack *track;
@end
