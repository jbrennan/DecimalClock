//
//  JBAppDelegate.m
//  DecimalClock
//
//  Created by Jason Brennan on 12-02-07.
//  Copyright (c) 2012 Jason Brennan. All rights reserved.
//

#import "JBAppDelegate.h"
#import "NSDate+DecimalTime.h"
#import "JBPreferencesWindowController.h"


static NSTimer *timer = nil;

@interface JBAppDelegate ()
@property (nonatomic, strong) NSStatusItem *statusItem;
@property (nonatomic, strong, readonly) JBPreferencesWindowController *preferencesWindowController;
@end

@implementation JBAppDelegate

@synthesize window = _window;
@synthesize appMenu = _appMenu;
@synthesize statusItem = _statusItem;
@synthesize preferencesWindowController = _preferencesWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[self.statusItem setTitle:@""];
	[self.statusItem setHighlightMode:YES];
	[self.statusItem setMenu:self.appMenu];
	
	//timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
	//[timer fire];
	[self timerFired:nil];
}


- (void)timerFired:(id)sender {
	//NSLog(@"%@", [NSDate decimalTimeString]);
	[self.statusItem setTitle:[NSDate daysSinceBirthdateString]];
	[self setupTimer];

}


- (void)setupTimer {
	// Should really do this with something like NSUserNotification instead, much less resource intensive!
	[self performSelector:@selector(timerFired:) withObject:nil afterDelay:60*60];
	
}

- (IBAction)showPreferencesWindow:(NSMenuItem *)sender {
	[self.preferencesWindowController showWindow:nil];
}


- (JBPreferencesWindowController *)preferencesWindowController {
	if (nil != _preferencesWindowController)
		return _preferencesWindowController;
	
	_preferencesWindowController = [[JBPreferencesWindowController alloc] initWithWindowNibName:@"JBPreferencesWindowController" owner:self];
	return _preferencesWindowController;
}


@end
