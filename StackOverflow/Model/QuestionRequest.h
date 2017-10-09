//
//  QuestionRequest.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataDelegate; 

@interface QuestionRequest : NSObject

@property (weak, nonatomic) id<DataDelegate> delegate;

- (void)fetchData;

@end
