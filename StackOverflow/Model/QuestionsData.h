//
//  QuestionsData.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsData : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSString *answer_count;
@property (strong, nonatomic) NSString *accepted_answer_id;

@end
