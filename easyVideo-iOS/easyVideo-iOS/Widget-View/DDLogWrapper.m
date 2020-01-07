//
//  DDLogWrapper.m
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

#import "DDLogWrapper.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <CocoaLumberjack/DDTTYLogger.h>

// Definition of the current log level
#if DEBUG
static const int ddLogLevel = DDLogLevelVerbose;
#else
static const int ddLogLevel = DDLogLevelWarn;
#endif
@implementation DDLogWrapper

+ (void)logVerbose:(NSString *)message {
    DDLogVerbose(message);
}

+ (void)logError:(NSString *)message {
    DDLogError(message);
}

+ (void)logInfo:(NSString *)message {
    DDLogInfo(message);
}

@end
