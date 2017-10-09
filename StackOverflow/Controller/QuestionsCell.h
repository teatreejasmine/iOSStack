//
//  QuestionsCell.h
//  StackOverflow
//
//  Created by Mali on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *acceptedAnswerImage;
@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UILabel *tags;
@property (weak, nonatomic) IBOutlet UILabel *answerCount;

@end
