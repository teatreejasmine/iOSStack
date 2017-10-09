//
//  DataResult.h
//  StackOverflow
//
//  Created by Malea on 2017/10/04.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataResult : NSObject

+ (NSArray *)resultFromJSON:(NSData *)objectNotation error:(NSError **)error;


@end
