//
//  JBPreferencesWindowController.m
//  DecimalClock
//
//  Created by Jason Brennan on 12-05-24.
//  Copyright (c) 2012 Jason Brennan. All rights reserved.
//

#import "JBPreferencesWindowController.h"

@interface JBPreferencesWindowController ()

@end

@implementation JBPreferencesWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
	NSLog(@"Window loaded");
}

@end
