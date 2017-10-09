//
//  QuestionRequest.m
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionRequest.h"
#import "DataDelegate.h"

@implementation QuestionRequest

- (void)fetchData {
    
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/questions?pagesize=50&order=desc&sort=creation&tagged=ios&site=stackoverflow"];
    
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
  
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (error) {
            [self.delegate fetchingDataFailedWithError:error];
        } else {
            [self.delegate receivedDataJSON:data];
        }
    }]resume];
}
@end
