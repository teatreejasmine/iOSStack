//
//  QuestionsTableViewController.m
//  StackOverflow
//
//  Created by Mali on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "QuestionsCell.h"
#import "QuestionsFetchDelegate.h"
#import "QuestionsResultFetch.h"
#import "QuestionsFields.h"

@interface QuestionsTableViewController () <QuestionsFetchDelegate> {
    NSArray *questionGroupResult;
    QuestionsResultFetch *_questionResult;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Display an activity indicator
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    _questionResult = [[QuestionsResultFetch alloc] init];
    _questionResult.questionRequest = [[QuestionRequest alloc] init];
    _questionResult.questionRequest.delegate = _questionResult;
    _questionResult.delegate = self;
    
    [_questionResult fetchQuestions];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return questionGroupResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    QuestionsFields *questionFieldResult = questionGroupResult[indexPath.row];
    cell.questionFields = questionFieldResult;

   
    return cell;
}

- (void)didReceiveQuestionGroups:(NSArray *)data {
    questionGroupResult = data;
   
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [activityIndicator stopAnimating];
    });
    
}

- (void)fetchingQuestionsFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}



@end
