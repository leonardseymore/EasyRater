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
@synthesize lblPlays = _lblPlays;
@synthesize track = _track;

- (id)init
{
    self = [super initWithNibName:@"DeleteTrackView" bundle:nil];
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
        
        if (newTrack.album && newTrack.album.length > 0) {
            _lblAlbum.stringValue = newTrack.album;
        } else {
            _lblAlbum.stringValue = NSLocalizedString(@"Unknown Album", @"Indicates an unknown album label");
        }
        
        if (newTrack.artist && newTrack.artist.length > 0) {
            _lblArtist.stringValue = newTrack.artist;
        } else {
            _lblArtist.stringValue = NSLocalizedString(@"Unknown Artist", @"Indicates an unknown artist label");
        }
        
    
        _lblTrack.stringValue = newTrack.name;
        _lblPlays.stringValue = [[NSString alloc] initWithFormat:@"%d", newTrack.playedCount];
    }
    _track = newTrack;
    
}

@end
