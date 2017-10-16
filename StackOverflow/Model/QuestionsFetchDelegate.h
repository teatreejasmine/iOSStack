//
//  DataFetchDelegate.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsFetchDelegate <NSObject>

- (void)didReceiveQuestionGroups:(NSArray *)groups;
- (void)fetchingQuestionsFailedWithError:(NSError *)error;

@end
