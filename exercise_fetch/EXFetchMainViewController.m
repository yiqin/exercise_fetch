//
//  EXFetchMainViewController.m
//  exercise_fetch
//
//  Created by kimberly on 10/15/13.
//  Copyright (c) 2013 GPShopper. All rights reserved.
//

#import "EXFetchMainViewController.h"
#import "EXTextFetcher.h"



@implementation EXFetchMainViewController

@synthesize fetchButton;
@synthesize textView;
@synthesize doneLabel;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self=[super initWithNibName: nibNameOrNil
                             bundle: nibBundleOrNil])
    {
        textFetcher=[[EXTextFetcher alloc] init];
        i = 0;
        lines = [[NSMutableString alloc] init];
    }
    return self;
}

-(IBAction)fetchNextLine: (id)sender
{
    [textFetcher fetchTextForLine:i++];
    [textFetcher setListener:self];
    fetchButton.userInteractionEnabled = NO;
}

#pragma mark - EXTextFetcherListener protocol delegate
-(void)exTextFetcher: (EXTextFetcher *)f
         fetchedText: (NSString *)s
             forLine: (NSUInteger)l{
    dispatch_async(dispatch_get_main_queue(), ^{
        /* UI code */
        fetchButton.userInteractionEnabled = YES;
        if (s != nil) {
            if (l == 0) {
                [lines setString:s];
            }
            else {
                [lines appendString:@"\n"];
                [lines appendString:s];
            }
            [textView setText:lines];
        }
        else {
            // here is to display donelibel.
            doneLabel.hidden = NO;
        }
    });
}

@end
