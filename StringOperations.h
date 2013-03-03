//
//  StringOperations.h
//  Algorithms
//
//  Created by Anil Punjabi on 2/23/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <string.h>

@interface StringOperations : NSObject


-(NSString *)reverseString:(NSString*) inputString;
-(NSString *)replaceVowels:(NSString*) inputString :(char)letter;
-(char *)reverseString2:(char[]) inputString;
-(int) factorialOfNumber:(int)inputNumber;

-(NSString *)quickSortTrial:(NSString *)givenString;

@end
