//
//  DDLogWrapper.m
//  easyVideo-iOS
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

#import "DDLogWrapper.h"
#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

// Definition of the current log level
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
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
