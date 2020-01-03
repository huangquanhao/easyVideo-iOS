//
//  DeviceTools.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "DeviceTools.h"

@implementation DeviceTools

+ (NSString *)getDeviceUUID
{
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"Identifier" accessGroup:nil];
    NSString *UUID = [keychainItem objectForKey:(__bridge id)kSecAttrGeneric];
    
    if ((UUID == nil) || UUID.length <= 0) {
        
        //UUID不存在则先创建UUID并保存，并且传值出去
        UUID = [self getUUIDString];
        [self saveUUIDToKeyChainWithUUIDString:UUID];
    }
    
    return UUID;
}

+ (void)saveUUIDToKeyChainWithUUIDString:(NSString *)uuidString
{
    // 如果想要跟其他的应用共享，则将accessGroup修改为共享使用的ID，具体如何配置请参考百度
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"Identifier" accessGroup:nil];
    NSString *string = [keychainItem objectForKey:(__bridge id)kSecAttrGeneric];
    
    if (string && string.length > 0) {
        
        if (![uuidString isEqualToString:string]) {
            NSLog(@"警告警告：需要查找原因，为什么会出现不相等的情况");
        }
    }
    else
    {
        [keychainItem setObject:uuidString.length > 0 ? uuidString : @"" forKey:(__bridge id)kSecAttrGeneric];
    }
}

+ (NSString *)getUUIDString
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    NSString *uuidString = [(__bridge NSString *)strRef stringByReplacingOccurrencesOfString:@"-" withString:@""];
    CFRelease(strRef);
    CFRelease(uuidRef);
    return uuidString;
}

+ (NSString *)getDeviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    
    if ([deviceString isEqualToString:@"iPhone4,2"])    return @"iPhone 4S";
    
    if ([deviceString isEqualToString:@"iPhone4,3"])    return @"iPhone 4S";
    
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6S Plus";
    
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    
    if ([deviceString isEqualToString:@"iphone10,1"])     return @"iphone 8";
    
    if ([deviceString isEqualToString:@"iphone10,4"])     return @"iphone 8";
    
    if ([deviceString isEqualToString:@"iphone10,2"])     return @"iphone 8 plus";
    
    if ([deviceString isEqualToString:@"iphone10,5"])     return @"iphone 8";
    
    if ([deviceString isEqualToString:@"iphone10,3"])     return @"iphone X";
    
    if ([deviceString isEqualToString:@"iphone10,6"])     return @"iphone X";
    
    if ([deviceString isEqualToString:@"iphone11,2"])     return @"iphone XS";
    
    if ([deviceString isEqualToString:@"iphone11,4"])     return @"iphone XS Max";
    
    if ([deviceString isEqualToString:@"iphone11,6"])     return @"iphone XS Max";
    
    if ([deviceString isEqualToString:@"iphone11,8"])     return @"iphone XR";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    NSLog(@"%s Error NOTE: Unknown device type: %@", __func__, deviceString);
    return @"iPhone";

}

+ (NSString *)getOriginalSystemVersion
{
    NSString *version = @"IOS version is unknow";
    float systemVersion = [[UIDevice currentDevice].systemVersion floatValue];
    if (systemVersion > 0)
    {
        version = [NSString stringWithFormat:@"%.2f",systemVersion];
    }
    return version;
}

+ (NSString *)getiPhoneName
{
    return [UIDevice currentDevice].name;
}

+ (NSString *)getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)getAppBuild
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

+ (NSString *)getAppBundleIdentify
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (CGFloat)getBatteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

+ (NSString *)getSystemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)getDeviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) { // 0 表示获取成功
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}

@end

