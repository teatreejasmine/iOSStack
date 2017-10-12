//
//  QuestionsDataObject.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "QuestionsFetchDelegate.h"
#import "QuestionsRequestDelegate.h"
#import "QuestionRequest.h"


@class QuestionsRequest; 

@interface QuestionsResultFetch : NSObject <QuestionsRequestDelegate>

@property (strong, nonatomic) QuestionRequest *questionRequest;
@property (weak, nonatomic) NSObject<QuestionsFetchDelegate> *delegate;
- (void)fetchQuestions;

@end


