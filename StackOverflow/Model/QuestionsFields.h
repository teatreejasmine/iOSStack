//
//  QuestionsData.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsFields : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSString *answers;
@property (strong, nonatomic) NSString *acceptedAnswerID;

@end
