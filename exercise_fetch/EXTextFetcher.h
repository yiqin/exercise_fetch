//
//  EXTextFetcher.h
//  exercise_fetch
//
//  Created by kimberly on 10/15/13.
//  Copyright (c) 2013 GPShopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EXTextFetcher;

@protocol EXTextFetcherListener <NSObject>

/**
 Returns a line of the text.
 
 If the line number exceeds the number of lines in the text,
 the text parameter will be nil.
 */
-(void)exTextFetcher: (EXTextFetcher *)f
         fetchedText: (NSString *)s
             forLine: (NSUInteger)l;

@end

@interface EXTextFetcher : NSObject
{
    NSInteger lineNum;
}

@property (assign) id<EXTextFetcherListener> listener;

-(void)fetchTextForLine: (NSUInteger)l;

@end
