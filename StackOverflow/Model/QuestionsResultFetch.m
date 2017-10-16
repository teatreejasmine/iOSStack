//
//  QuestionsDataObject.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsResultFetch.h"
#import "QuestionsFields.h"

@implementation QuestionsResultFetch
- (void)fetchQuestions {
    [self.questionRequest fetchQuestionsFromURL];
}

- (void)receivedQuestionsJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *questionsGroup = [self questionsResultFromJSON:objectNotation error:&error];
    
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

- (NSArray *)questionsResultFromJSON:(NSData *)objectNotation error:(NSError **)error {
    NSError *localError = nil;
    NSDictionary *parsedQuestionDictionary = [NSJSONSerialization JSONObjectWithData:objectNotation options:NSJSONReadingAllowFragments error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *itemsResult = [parsedQuestionDictionary valueForKey:@"items"];
    NSData *questionsData = [NSJSONSerialization dataWithJSONObject:itemsResult options:NSJSONWritingPrettyPrinted error:error];
    NSString *questionString = [[NSString alloc] initWithData:questionsData encoding:NSUTF8StringEncoding];
    NSError *err = nil;
    NSArray *questionsArray = [NSJSONSerialization JSONObjectWithData:[questionString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];
    
    for (NSDictionary *questionDictionary in questionsArray) {
        QuestionsFields *questionFields = [[QuestionsFields alloc] init];
        for (NSString *key in questionDictionary) {
            if ([key isEqualToString:@"answer_count"]) {
                [questionFields setValue:[questionDictionary valueForKey:key] forKey:@"answers"];
                
            } else if([key isEqualToString:@"accepted_answer_id"]) {
                [questionFields setValue:[questionDictionary valueForKey:key] forKey:@"acceptedAnswerID"];
                
            } else if([key isEqualToString:@"tags"]) {
                [questionFields setValue:[questionDictionary valueForKey:key] forKey:key];
                
            } else if([key isEqualToString:@"title"]) {
                [questionFields setValue:[questionDictionary valueForKey:key] forKey:key];
                
            }
            
        }
        [result addObject:questionFields];
    }
    
    return result;
}

@end
