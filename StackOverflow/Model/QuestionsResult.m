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
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
   
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *results = [parsedObject valueForKey:@"items"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:results options:NSJSONWritingPrettyPrinted error:error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSError *err = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];

    for (NSDictionary *questionDictionary in array) {
        QuestionsFields *questionFields = [[QuestionsFields alloc] init];
        for (NSString *key in questionDictionary) {
            if ([questionFields respondsToSelector:NSSelectorFromString(key)]) {
                [questionFields setValue:[questionDictionary valueForKey:key] forKey:key];

            }
        }
        [result addObject:questionFields];
    }

    return result;
}

@end
