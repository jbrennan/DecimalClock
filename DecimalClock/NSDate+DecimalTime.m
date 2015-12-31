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


+ (NSString *)daysSinceBirthdateString {
	
	NSDate *today = [[NSDate date] dateAtMidnight];
	NSDate *birthday = [NSDate dateWithNaturalLanguageString:@"June 27 1988"];
	return [NSString stringWithFormat:@"%ld", [self daysBetweenDate:birthday andDate:today]];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
	NSDate *fromDate;
	NSDate *toDate;
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	[calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
				 interval:NULL forDate:fromDateTime];
	[calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
				 interval:NULL forDate:toDateTime];
	
	NSDateComponents *difference = [calendar components:NSCalendarUnitDay
											   fromDate:fromDate toDate:toDate options:0];
	
	return [difference day];
}


- (NSDate *)dateAtMidnight {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"yyyy-M-d";
	
	NSString *formattedTime = [formatter stringFromDate:self];
	NSDate *date = [formatter dateFromString:formattedTime];
	
	return date;
}


@end
