//
//  JSZSessionManager.h
//  PubNub
//
//  Created by Jordan Zucker on 4/13/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface JSZSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (NSURLSessionDataTask *)helloWorldGet;

- (NSURLSessionDataTask *)subscribeTest;

- (NSURLSessionDataTask *)historyTest;

@end
