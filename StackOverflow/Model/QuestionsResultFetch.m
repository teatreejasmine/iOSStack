//
//  QuestionsDataObject.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsResultFetch.h"
#import "QuestionsResult.h"

@implementation QuestionsResultFetch
- (void)fetchQuestions {
    [self.questionRequest fetchQuestionsFromURL];
}

- (void)receivedQuestionsJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *questionsGroup = [QuestionsResult questionsResultFromJSON:objectNotation error:&error];
    
    if (self.delegate) {
        if (error != nil) {
            [self.delegate fetchingQuestionsFailedWithError:error];
            
        } else {
            [self.delegate didReceiveQuestionGroups:questionsGroup];
        }
    } else {
         NSLog(@"Error: self.delegate %@", self.delegate);
        
    }
    
}

- (void)fetchingQuestionsFailedWithError:(NSError *)error {
    [self.delegate fetchingQuestionsFailedWithError:error];
}

@end
