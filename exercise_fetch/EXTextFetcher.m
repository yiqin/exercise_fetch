//
//  EXTextFetcher.m
//  exercise_fetch
//
//  Created by kimberly on 10/15/13.
//  Copyright (c) 2013 GPShopper. All rights reserved.
//

#import "EXTextFetcher.h"
#import <stdlib.h>
#import <unistd.h>


@implementation EXTextFetcher

@synthesize listener;

-(id)init
{
    if (self=[super init])
    {
        lineNum=-1;
    }
    return self;
}

-(void)fetchTextForLine: (NSUInteger)l
{
    NSAssert(lineNum < 0, @"ERROR:  concurrent fetches not allowed.");

    lineNum=l;
    
    NSString *line=(lineNum < [[EXTextFetcher _lines] count]
                    ? [[EXTextFetcher _lines] objectAtIndex: lineNum]
                    : nil);
    
    [self performSelectorInBackground: @selector(_waitAndReturn:)
                           withObject: line];
}

-(void)_waitAndReturn: (NSString *)s
{
    @autoreleasepool
    {
        uint32_t x=arc4random();
        sleep((x % 4) + 2);

        NSUInteger l=(lineNum >= 0 ? lineNum : 0);
        lineNum=-1;
        
        if ([listener respondsToSelector: @selector(exTextFetcher:fetchedText:forLine:)])
        {
            [listener exTextFetcher: self
                        fetchedText: s
                            forLine: l];
        }
    }
}

+(NSArray *)_lines
{
    return @[@"Lorem ipsum dolor sit amet,",
             @"consectetur adipisicing elit,",
             @"sed do eiusmod tempor incididunt ut labore",
             @"et dolore magna aliqua."];
}

@end
