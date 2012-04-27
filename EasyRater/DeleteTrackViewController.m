//
//  DeleteTrackViewController.m
//  EasyRater
//
//  Created by Leonard Seymore on 2012/04/27.
//  Copyright (c) 2012 leonardseymore@gmail.com. All rights reserved.
//

#import "DeleteTrackViewController.h"

@interface DeleteTrackViewController ()

@end

@implementation DeleteTrackViewController

@synthesize vwArtwork = _vwArtwork;
@synthesize lblAlbum = _lblAlbum;
@synthesize lblArtist = _lblArtist;
@synthesize lblTrack = _lblTrack;
@synthesize track = _track;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) setTrack : (iTunesTrack*)newTrack
{
    if (newTrack) {
        if (newTrack.artworks.count > 0) {
            iTunesArtwork *firstArtwork = [newTrack.artworks objectAtIndex:0];
            NSImage *albumArt = [[NSImage alloc] initWithData:firstArtwork.rawData];
            [_vwArtwork setImage:albumArt];
        } else {
            [_vwArtwork setImage:[NSImage imageNamed:@"defaultAlbumArt.png"]];
        }
        _lblAlbum.stringValue = newTrack.album;
        _lblArtist.stringValue = newTrack.artist;
        _lblTrack.stringValue = newTrack.name;
    }
    _track = newTrack;
    
}

@end
