//
//  RCTMediaPlayerVideo.h
//  RCTMediaPlayer
//
//  Created by Matteo on 21/07/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTView.h"
#import <MediaPlayer/MediaPlayer.h>

extern NSString *const RCTMediaPlayerVideoEndEvent;

@class RCTEventDispatcher;

@interface RCTMediaPlayerVideo : UIView
- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;
@end
