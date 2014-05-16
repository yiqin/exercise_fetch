//
//  EXFetchMainViewController.h
//  exercise_fetch
//
//  Created by kimberly on 10/15/13.
//  Copyright (c) 2013 GPShopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXTextFetcher.h"
#import <dispatch/dispatch.h>

@class EXTextFetcher;

@interface EXFetchMainViewController : UIViewController <EXTextFetcherListener>
{
    @private
    EXTextFetcher *textFetcher;
    int i;
    NSMutableString *lines;
}

@property (readonly) IBOutlet UITextView *textView;
@property (readonly) IBOutlet UIButton *fetchButton;
@property (readonly) IBOutlet UILabel *doneLabel;

-(IBAction)fetchNextLine: (id)sender;

@end
