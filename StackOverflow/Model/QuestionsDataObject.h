//
//  QuestionsDataObject.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "DataFetchDelegate.h"
#import "DataDelegate.h"
#import "QuestionRequest.h"


@class QuestionsRequest; 

@interface QuestionsDataObject : NSObject <DataDelegate>

@property (strong, nonatomic) QuestionRequest *questionRequest;
@property (weak, nonatomic) id <DataFetchDelegate> delegate;

- (void)getData;

@end


