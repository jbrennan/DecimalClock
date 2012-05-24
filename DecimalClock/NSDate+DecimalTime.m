//
//  NSDate+DecimalTime.m
//  DecimalClock
//
//  Created by Jason Brennan on 12-02-07.
//  Copyright (c) 2012 Jason Brennan. All rights reserved.
//

#import "NSDate+DecimalTime.h"

@implementation NSDate (DecimalTime)


+ (NSString *)decimalTimeString {
	
	NSDate *date = [NSDate date];
	NSDate *today = [date dateAtMidnight]; 
	
	NSTimeInterval secondsToday = [date timeIntervalSinceDate:today];
	
	NSTimeInterval decimalTimeToday = secondsToday/86.4;
	
	return [NSString stringWithFormat:@"%3.f", decimalTimeToday];
}


- (NSDate *)dateAtMidnight {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"yyyy-M-d";
	
	NSString *formattedTime = [formatter stringFromDate:self];
	NSDate *date = [formatter dateFromString:formattedTime];
	
	return date;
}


@end
