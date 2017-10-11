//
//  QuestionsDataObject.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsResultFetch.h"
#import "DataResult.h"

@implementation QuestionsResultFetch

- (void)fetchQuestions {
    [self.questionRequest fetchData];
}

- (void)receivedDataJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *questionsGroup = [DataResult questionsDataFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingDataFailedWithError:error];

    } else {
        [self.delegate didReceiveQuestionGroups:questionsGroup];
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    [self.delegate fetchingDataFailedWithError:error];
}

@end
