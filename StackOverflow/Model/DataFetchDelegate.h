//
//  DataFetchDelegate.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataFetchDelegate <NSObject>

- (void)didReceiveData:(NSArray *)groups;
- (void)fetchingDataFailedWithError:(NSError *)error;

@end
