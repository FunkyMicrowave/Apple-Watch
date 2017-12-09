//
//  InterfaceController.m
//  Watchapplication WatchKit Extension
//
//  Created by Vefmótsforritun on 15/11/17.
//  Copyright © 2017 Vefmótsforritun. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController
@synthesize LabelBPM;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    LabelBPM.text = @"130 BPM";
    
    
    beatPerMinuteValue = 130;
    [self PlayBeat];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(IBAction)IncreaseBeat:(id)sender
{
    beatPerMinuteValue = beatPerMinuteValue + 10;
}

-(IBAction)DecreaseBeat:(id)sender
{
    beatPerMinuteValue = beatPerMinuteValue - 10;
}



-(void)PlayBeat
{
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeNotification];
    
    LabelBPM.text = [NSString stringWithFormat:@"%.0f BPM", beatPerMinuteValue];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSTimer scheduledTimerWithTimeInterval:(60/beatPerMinuteValue) target:self selector:@selector((PlayBeat)) userInfo:nil repeats:NO];
    });
}

@end



