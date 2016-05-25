//
//  NSDate+Helper.m
//  MyTestProject
//
//  Created by 舒永超 on 16/5/25.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

+ (NSString *)stringWithIntervalSince1970:(NSTimeInterval)timeInterval{

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval];
    NSString *time = [df stringFromDate:date];

    return time;
}

@end
