//
//  Manager.h
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/8.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDMulticastDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ManagerDelegate<NSObject>

// MARK: EVSDK


@end

@interface Manager : NSObject
{
    GCDMulticastDelegate<ManagerDelegate> *_delegates;
}

+ (instancetype)sharedManager;
 
- (void)_addDelegate:(id<ManagerDelegate>)delegate delegateQueue:(dispatch_queue_t)queue;
- (void)removeDelegate:(id<ManagerDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
