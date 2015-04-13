//
//  JSZSessionManager.m
//  PubNub
//
//  Created by Jordan Zucker on 4/13/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "JSZSessionManager.h"

static NSString * const kPubKey = @"pub-c-366ee301-3a9a-41ca-b3f2-d9dba11dbd10";
static NSString * const kSubKey = @"sub-c-66eb5ede-fb1c-11e3-bacb-02ee2ddab7fe";

@implementation JSZSessionManager

+ (instancetype)sharedInstance {
    static JSZSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *baseURLString = [NSString stringWithFormat:@"http://pubsub.pubnub.com"];
        
        sharedInstance = [[JSZSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
//        sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        sharedInstance.requestSerializer.timeoutInterval = 330;
    });
    
    return sharedInstance;
}

- (NSURLSessionDataTask *)helloWorldGet {
    NSString *urlString = [NSString stringWithFormat:@"publish"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@",
                                                     kPubKey,
                                                     kSubKey,
                                                     @"signature",
                                                     @"test-channel",
                                                     @"0",
                                                     @"%22Hello%20World%22"];
    return [self GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"task is %@", task);
        NSLog(@"responseObject is %@", responseObject);
        NSLog(@"responseObject: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//        NSArray *responseArray = [NSKeyedUnarchiver unarchiveObjectWithData:responseObject];
//        NSLog(@"responseArray is %@", responseArray);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"task is %@", task);
        NSLog(@"error is %@", error);
    }];
    
}

- (NSURLSessionDataTask *)subscribeTest {
    NSString *urlString = [NSString stringWithFormat:@"subscribe"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@",
                                                     kSubKey,
                                                     @"test-channel",
                                                     @"0",
                                                     @"14289513570789402"];
    return [self GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"task is %@", task);
        NSLog(@"responseObject is %@", responseObject);
        NSLog(@"responseObject: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"task is %@", task);
        NSLog(@"error is %@", error);
    }];
}

- (NSURLSessionDataTask *)historyTest {
//    http://pubsub.pubnub.com
//        /history
//        /sub-key
//        /channel
//        /callback
//        /limit
    NSString *urlString = [NSString stringWithFormat:@"history"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@"
                                                     @"/%@",
                                                     kSubKey,
                                                     @"test-channel",
                                                     @"0",
                                                     @"15"];
    return [self GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"task is %@", task);
        NSLog(@"responseObject is %@", responseObject);
        NSLog(@"responseObject: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"task is %@", task);
        NSLog(@"error is %@", error);
    }];
}

@end
