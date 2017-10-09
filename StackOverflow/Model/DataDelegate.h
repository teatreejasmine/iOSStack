//
//  DataDelegate.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataDelegate <NSObject>

- (void)receivedDataJSON:(NSData *)objectNotation;
- (void)fetchingDataFailedWithError:(NSError *)error;

@end
