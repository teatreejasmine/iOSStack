//
//  DataDelegate.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsRequestDelegate <NSObject>

- (void)receivedQuestionsJSON:(NSData *)objectNotation;
- (void)fetchingQuestionsFailedWithError:(NSError *)error;

@end
