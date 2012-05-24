//
//  NSDate+DecimalTime.h
//  DecimalClock
//
//  Created by Jason Brennan on 12-02-07.
//  Copyright (c) 2012 Jason Brennan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DecimalTime)

+ (NSString *)decimalTimeString;
- (NSDate *)dateAtMidnight;

@end
