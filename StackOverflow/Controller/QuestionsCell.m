//
//  QuestionsCell.m
//  StackOverflow
//
//  Created by Mali on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsCell.h"
#import "QuestionsFields.h"

@implementation QuestionsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setQuestionFields:(QuestionsFields *)questionFields {
    //Select image based on whether the answer is accepted or not
    if (questionFields.acceptedAnswerID) {
        self.acceptedAnswerImageView.image =  [UIImage imageNamed: @"greencircle.png"];
        
    } else {
        self.acceptedAnswerImageView.image =  [UIImage imageNamed: @"greycircle.png"];
        
    }

    self.questionTitleLabel.text = questionFields.title;
    self.answersLabel.text = [NSString stringWithFormat:@"%@", questionFields.answers];
    self.tagsLabel.text =  [questionFields.tags componentsJoinedByString:@" "];
    
}

- (void)prepareForReuse {
    [super prepareForReuse];

    self.questionTitleLabel.text = @"";
    self.tagsLabel.text = @"";
    self.answersLabel.text = @"";
    self.acceptedAnswerImageView.image = nil;
}

@end
