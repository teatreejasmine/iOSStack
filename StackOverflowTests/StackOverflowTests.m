//
//  StackOverflowTests.m
//  StackOverflowTests
//
//  Created by Malea Kotelo on 10/13/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionsResultFetch.h"

@interface StackOverflowTests : XCTestCase
@property (nonatomic) QuestionsResultFetch *questionResultTest;

@end

@implementation StackOverflowTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _questionResultTest = [[QuestionsResultFetch alloc] init];

}

- (void) testDataSendToQuestionsResultFromJSONIsNotNil {
    //Build up mock data
    NSArray *tags =[NSArray arrayWithObjects: @"ios", @"kween", nil];
    NSDictionary *owner = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"ali",@"display_name",
                           @"https://stackoverflow.com/users/8709646/ali",@"link",
                           @"https://www.gravatar.com/avatar/226b0c0bf1611d21b65e8b34b94899b6?s=128&d=identicon&r=PG&f=1",@"profile_image",
                           @"6",@"reputation",
                           @"8709646",@"user_id",
                           @"registered",@"user_type",
                           nil];
    NSDictionary *itemsData = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"1", @"answer_count",
                               @"1507905920", @"creation_date",
                               @"0", @"is_answered",
                               @"1507905920", @"last_activity_date",
                               @"https://stackoverflow.com/questions/46732546/uitextview-startinteractionwithlinkatpoint-crash-ios-11-only", @"link",
                               owner, @"owner",
                               @"46732839", @"question_id",
                               @"1", @"score",
                               tags, @"tags",
                               nil];
    NSArray *itemsArray =[NSArray arrayWithObjects: itemsData, nil];
    NSDictionary *itemsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"1", @"has_more",
                                itemsArray, @"items",
                                nil];
    NSData *questionsData = [NSJSONSerialization dataWithJSONObject:itemsDictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSArray *questionArray = [_questionResultTest questionsResultFromJSON:questionsData error:(nil)];
    XCTAssertNotNil(questionArray, @"Data is not nil");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
