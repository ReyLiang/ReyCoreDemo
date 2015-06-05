//
//  UIDeviceHardware.h
//  BatteryLife
//
//  Created by xujianwei on 09-8-11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIDeviceHardware : NSObject 

+ (NSString *) platform;
+ (NSString *) platformString;
+ (NSInteger) platformIndex;
@end
