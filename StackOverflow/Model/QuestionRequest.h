//
//  QuestionRequest.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsRequestDelegate;

@interface QuestionRequest : NSObject

@property (weak, nonatomic) NSObject<QuestionsRequestDelegate> *delegate;
- (void)fetchQuestionsFromURL;

@end
