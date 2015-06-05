//
//  UIDeviceHardware.m
//  BatteryLife
//
//  Created by xujianwei on 09-8-11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDeviceHardware

+ (NSString *) platform{
    NSString * platform = [[UIDevice currentDevice] model];
	return platform;
}

+ (NSString *) platformString{
	NSString *platform = [self platform];
	if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
	if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
	if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4 GSM";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4 CDMA";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
	if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
	if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
	if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
	if ([platform isEqualToString:@"i386"])		 return @"iPhone Simulator";
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad1";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2 Wifi";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2 3G";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2 CDMA";
    
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3 Wifi";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3 3G";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3 CDMA";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4 Wifi";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4 3G";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4 CDMA";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini Wifi";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 3G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini CDMA";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5 GSM";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5 CDMA";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5C GSM";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5C CDMA";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5S GSM";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5S CDMA";

	return platform;
}

+ (NSInteger) platformIndex{
	NSString *platform = [self platform];	
	if ([platform isEqualToString:@"iPhone1,1"]) return 0;
	if ([platform isEqualToString:@"iPhone1,2"]) return 1;
	if ([platform isEqualToString:@"iPhone2,1"]) return 2;
    if ([platform isEqualToString:@"iPhone3,1"]) return 3;
    if ([platform isEqualToString:@"iPhone3,3"]) return 4;
    if ([platform isEqualToString:@"iPhone4,1"]) return 5;
	if ([platform isEqualToString:@"iPod1,1"])   return 6;
	if ([platform isEqualToString:@"iPod2,1"])   return 7;
	if ([platform isEqualToString:@"iPod3,1"])   return 8;
	if ([platform isEqualToString:@"i386"])		 return 9;	
    if ([platform isEqualToString:@"iPad1,1"])   return 10;
    if ([platform isEqualToString:@"iPad2,1"])   return 11;
    if ([platform isEqualToString:@"iPad2,2"])   return 12;
    if ([platform isEqualToString:@"iPad2,3"])   return 13;
    
    if ([platform isEqualToString:@"iPad3,1"])   return 14;
    if ([platform isEqualToString:@"iPad3,2"])   return 15;
    if ([platform isEqualToString:@"iPad3,3"])   return 16;
    
    if ([platform isEqualToString:@"iPad4,1"])   return 17;
    if ([platform isEqualToString:@"iPad4,2"])   return 18;
    if ([platform isEqualToString:@"iPad4,3"])   return 19;
    
    if ([platform isEqualToString:@"iPad2,5"])   return 20;
    if ([platform isEqualToString:@"iPad2,6"])   return 21;
    if ([platform isEqualToString:@"iPad2,7"])   return 22;
    
    if ([platform isEqualToString:@"iPhone5,1"]) return 23;
    if ([platform isEqualToString:@"iPhone5,2"]) return 24;
    
    if ([platform isEqualToString:@"iPhone5,3"]) return 25;
    if ([platform isEqualToString:@"iPhone5,4"]) return 26;
    
    if ([platform isEqualToString:@"iPhone6,1"]) return 27;
    if ([platform isEqualToString:@"iPhone6,2"]) return 28;
    
	return -1;
}

@end