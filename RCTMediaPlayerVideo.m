//
//  RCTMediaPlayerVideo.m
//  RCTMediaPlayer
//
//  Created by Matteo on 21/07/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//
#import "UIView+React.h"
#import "RCTEventDispatcher.h"
#import "RCTMediaPlayerVideo.h"


NSString *const RCTMediaPlayerVideoEndEvent = @"improntaadvance_mediaplayer_videoEnd";


@implementation RCTMediaPlayerVideo {
    MPMoviePlayerController *_moviePlayer;
    RCTEventDispatcher *_eventDispatcher;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if ((self = [super init])) {
        _eventDispatcher = eventDispatcher;
    }
    
    return self;
}

- (void)setSrc:(NSString *)video
{
    NSString *localPath = [[NSBundle mainBundle] pathForResource:video ofType:@"mp4"];
    NSURL *url;
    
    if(localPath) {
        url = [NSURL fileURLWithPath:localPath];
    } else {
        url = [NSURL URLWithString:video];
    }

    _moviePlayer =  [[MPMoviePlayerController alloc] initWithContentURL:url];
    _moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    _moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    _moviePlayer.shouldAutoplay = YES;

    [self addSubview:_moviePlayer.view];
    [_moviePlayer prepareToPlay];
    [self attachListeners];
}

- (void)attachListeners
{
    // listen for end of file
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
}

- (void)playbackFinished:(NSNotification*)notification {
    [_eventDispatcher sendInputEventWithName:RCTMediaPlayerVideoEndEvent body:@{
                                                                    @"target": self.reactTag
                                                                    }];
}

#pragma mark - React View Management

- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
    //RCTLogError(@"video cannot have any subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    //RCTLogError(@"video cannot have any subviews");
    return;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    _moviePlayer.view.frame = self.bounds;
    [CATransaction commit];
}

- (void)removeFromSuperview
{
    
    [_moviePlayer pause];
    _moviePlayer = nil;
    _eventDispatcher = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super removeFromSuperview];
}
@end
