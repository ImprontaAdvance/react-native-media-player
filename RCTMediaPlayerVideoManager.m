//
//  RCTMediaPlayerVideoManager.m
//  RCTMediaPlayer
//
//  Created by Matteo on 21/07/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTMediaPlayerVideoManager.h"
#import "RCTMediaPlayerVideo.h"
#import "RCTBridge.h"


@implementation RCTMediaPlayerVideoManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view
{
    return [[RCTMediaPlayerVideo alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (NSDictionary *)customDirectEventTypes
{
    return @{
             RCTMediaPlayerVideoEndEvent: @{
                     @"registrationName": @"onVideoEnd"
             }
    };
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(src, NSString);
@end
