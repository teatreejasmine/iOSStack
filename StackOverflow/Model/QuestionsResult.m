//
//  DataResult.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsResult.h"
#import "QuestionsFields.h"

@implementation QuestionsResult

+ (NSArray *)questionsResultFromJSON:(NSData *)objectNotation error:(NSError **)error {
    NSError *localError = nil;
    NSDictionary *parsedQuestionDictionary = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
   
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *results = [parsedQuestionDictionary valueForKey:@"items"];
    NSData *questionsData = [NSJSONSerialization dataWithJSONObject:results options:NSJSONWritingPrettyPrinted error:error];
    NSString *questionString = [[NSString alloc] initWithData:questionsData encoding:NSUTF8StringEncoding];
    NSError *err = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[questionString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];

    for (NSDictionary *questionDictionary in array) {
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
