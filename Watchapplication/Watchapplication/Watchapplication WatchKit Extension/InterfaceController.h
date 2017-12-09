//
//  InterfaceController.h
//  Watchapplication WatchKit Extension
//
//  Created by Vefmótsforritun on 15/11/17.
//  Copyright © 2017 Vefmótsforritun. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
{
    float beatPerMinuteValue;
}

@property(nonatomic,retain) IBOutlet WKInterfaceLabel *LabelBPM;

-(IBAction)IncreaseBeat:(id)sender;
-(IBAction)DecreaseBeat:(id)sender;

@end
