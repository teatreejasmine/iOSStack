//
//  QuestionsCell.h
//  StackOverflow
//
//  Created by Mali on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *acceptedAnswerImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagsLabel;
@property (weak, nonatomic) IBOutlet UILabel *answersLabel;

@end
