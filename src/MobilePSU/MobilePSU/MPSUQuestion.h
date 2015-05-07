//
//  MPSUQuestion.h
//  MobilePSU
//
//  Created by Felipe Ramirez on 3/13/14.
//  Copyright (c) 2014 Moshisoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPSUQuestion : NSObject

@property (nonatomic, assign) int questionIndex;

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSArray *alternatives;

@property (nonatomic, assign) int correctAnswerIndex; // Can be either 0, 1, 2, 3 or 4

@end
