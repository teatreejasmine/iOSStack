//
//  QuestionsTableViewController.m
//  StackOverflow
//
//  Created by Mali on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "QuestionsCell.h"
#import "DataFetchDelegate.h"
#import "QuestionsDataObject.h"
#import "QuestionsData.h"


@interface QuestionsTableViewController () <DataFetchDelegate> {
    NSArray *dataResult;
    QuestionsDataObject *dataObject;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation QuestionsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Display a code loading indicator
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.alpha = 1.0;
    [self.view addSubview:activityIndicator];
    activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    [activityIndicator startAnimating];

    dataObject = [[QuestionsDataObject alloc] init];
    dataObject.questionRequest = [[QuestionRequest alloc] init];
    dataObject.questionRequest.delegate = dataObject;
    dataObject.delegate = self;
    
    [dataObject getData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    QuestionsData *questionData = dataResult[indexPath.row];
    
    //Select image based on whether the answer is accepted or not
    if (questionData.accepted_answer_id) {
        cell.acceptedAnswerImageView.image =  [UIImage imageNamed: @"greencircle.png"];
        
    } else {
        cell.acceptedAnswerImageView.image =  [UIImage imageNamed: @"greycircle.png"];
    }
    
    cell.questionTitleLabel.text = questionData.title;
    cell.answersLabel.text = [NSString stringWithFormat:@"%@", questionData.answer_count];
    cell.tagsLabel.text =  [questionData.tags componentsJoinedByString:@" "];
   
    return cell;
}

- (void)didReceiveData:(NSArray *)data {
    dataResult = data;
   
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [activityIndicator stopAnimating];
    });
    
}

- (void)fetchingDataFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}



@end
