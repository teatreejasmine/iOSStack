//
//  QuestionsDataObject.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsDataObject.h"
#import "DataResult.h"

@implementation QuestionsDataObject

- (void)getData {
    [self.questionRequest fetchData];
}

- (void)receivedDataJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *dataResult = [DataResult resultFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingDataFailedWithError:error];

    } else {
        [self.delegate didReceiveData:dataResult];
    }
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    [self.delegate fetchingDataFailedWithError:error];
}

@end
