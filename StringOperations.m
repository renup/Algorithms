//
//  StringOperations.m
//  Algorithms
//
//  Created by Anil Punjabi on 2/23/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "StringOperations.h"

@interface StringOperations(){
    

}

@property (nonatomic, copy) NSMutableString * mainAlteredStr;

@end

@implementation StringOperations

@synthesize mainAlteredStr;

-(int) factorialOfNumber:(int)inputNumber {
        if (inputNumber ==1) {
            return 1;
        }
       int MultipliedResult = inputNumber * [self factorialOfNumber:(inputNumber-1)];  /// 3* fact(2)
    return MultipliedResult;
}

-(NSString *)threadingDiceLetters:(NSString *)givenStr {
    return nil;
    
}

-(NSString *)quickSortTrial:(NSString *)givenString{
    if (givenString.length <=1) {
        return givenString;
    }
    NSMutableString * sortedStr = [[NSMutableString alloc] init];


    NSMutableString * rightStr = [[NSMutableString alloc] init];
    NSMutableString * leftStr = [[NSMutableString alloc] init];
    NSString *leftResult= [[NSString alloc] init];
    NSString *rightResult= [[NSString alloc] init];
    
    int totalLengthOfString = givenString.length;
    int middleNumber;
    
    if (totalLengthOfString % 2) {
        middleNumber = (totalLengthOfString +1)/2 ; //odd
    }else{
        middleNumber = (totalLengthOfString +2)/2 ; //even
    }
    char pivot = [givenString characterAtIndex:(middleNumber-1)];
    
    if (pivot == ' ') {
        pivot = [givenString characterAtIndex:middleNumber];
    }

    for (int i =0; i< totalLengthOfString; i++) {
//        NSLog(@"char = %c", [givenString characterAtIndex:i]);
        if ([givenString characterAtIndex:i]  > pivot  ) {
            [rightStr appendFormat:@"%@",[NSString stringWithFormat:@"%c", [givenString characterAtIndex:i]]];
            
        }else if([givenString characterAtIndex:i] == ' ' || [givenString characterAtIndex:i] == pivot ){
            //do nothing
        }else{
            [leftStr appendFormat:@"%@",[NSString stringWithFormat:@"%c", [givenString characterAtIndex:i]]];
        }
    }
    
    if (leftStr.length >=1) {
        leftResult = [self quickSortTrial:leftStr];
    }

    if (rightStr.length >=1) {
        rightResult = [self quickSortTrial:rightStr];
    }
    
        [sortedStr appendString:[NSString stringWithFormat:@"%@%c%@", leftResult,pivot,rightResult]];

    return sortedStr;
}

//-(NSString *)reverseString:(char*) myStr {

//inputstring = @"ABCD"; //outputstring = @"DCBA"
//inputstring = @"This is 1"; //outputstring = @"1 si sihT"
//inputstring = @"ABBA"; //outputstring = @"ABBA"
//inputstring = @""; //outputstring = @""
//inputstring = @"A"; //outputstring = @"A"


// Correctness
// Boundary Conditions {0 length, 1 length, negative length, really really long length(int >2147483647), special characters in string like /}
// Field size: http://stackoverflow.com/questions/2107544/types-in-objective-c-on-iphone
// Alternate conditions { all possible scenarios }
// Memory Usage for each condition { clases created or string created, memory used by variables,
// Exception handling { in case of failure for boundary conditions, will your program crash}
// memory freed?


// 0 -> no memory used
// 1 -> no memory used
// 2 -> newstring + char ===> char
// 3 -> char



-(NSString *)reverseString:(NSString*) inputString {
    if (inputString.length >2) {
        NSMutableString * newStr = [[NSMutableString alloc] init] ;
        for(int i =inputString.length-1; i>=0; --i) {
            char letter = [inputString characterAtIndex:i];
            [newStr appendFormat:@"%@", [NSString stringWithFormat:@"%c", letter]];
        }
        return newStr;
    }else if (inputString.length ==2){
        inputString = [NSString stringWithFormat: @"%@%@", [NSString stringWithFormat:@"%c", [inputString characterAtIndex:1]],  [NSString stringWithFormat:@"%c", [inputString characterAtIndex:0]]];
        
        return inputString;
    }else{
         return inputString;
    }
    
}

-(char *)reverseString2:(char[]) inputString {

    int len = strlen(inputString);
    char ltr ;
    
    for (int i =0; i < len; i++) {
        ltr = inputString[len-(i+1)];
        inputString[len-(i+1)] = inputString[i];
        inputString[i] = ltr;
    }
    
    return inputString;

}




// replace the vowels with the letter passed to you
// Correctness
// Boundary Conditions {0 length, 1 length, negative length, really really long length(int >2147483647), special characters in string like /}
// Field size: http://stackoverflow.com/questions/2107544/types-in-objective-c-on-iphone

// Alternate conditions { all possible scenarios }
// Memory Usage for each condition { clases created or string created, memory used by variables,
// Exception handling { in case of failure for boundary conditions, will your program crash}
// memory freed?


// 0 -> no memory used
// 1 -> no memory used
// 2 -> newstring + char ===> char
// 3 -> char


-(NSString *)replaceVowels:(NSString*) inputString :(char)letter {

    if (inputString.length >=1) {
        NSMutableString * mutableStr = [[NSMutableString alloc] init];
        for (int j=0; j<inputString.length; j++) {
    
            switch ([inputString characterAtIndex:j]) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                    [mutableStr insertString:[NSString stringWithFormat:@"%c",letter] atIndex:j];
                    break;
                default:
                    [mutableStr appendFormat:@"%@", [NSString stringWithFormat:@"%c", [inputString characterAtIndex:j]]];
                    break;
            }
        }    return mutableStr;
    }else{
        return inputString;
    }
}

// Find out if a string is within another string and return the position where you find the other string
- (int) findStr:(NSString*) origStr : (NSString*) strToFind{
    
    return 1;
    
}

// Sort a string - using merge sort, quick sort, binary sort, hash table and compare performance.
// nslog current time when method starts, and when method ends

-(NSString *)removeRepeatedLetters:(NSString *)givenStr {
    NSMutableString * strWithNoRepeatition = [[NSMutableString alloc] init];
    [strWithNoRepeatition appendString:[NSString stringWithFormat:@"%c", [givenStr characterAtIndex:0]]];
    for(int a = 1; a< givenStr.length; a++){
        NSLog(@"alphabet to compare with = %c", [givenStr characterAtIndex:a]);
        for (int b =0; b<strWithNoRepeatition.length; b++) {
            if ([givenStr characterAtIndex:a] == [strWithNoRepeatition characterAtIndex:b]) {
                break;
            }else if ([givenStr characterAtIndex:a] != [strWithNoRepeatition characterAtIndex:b] || b == strWithNoRepeatition.length)  {
                    NSLog(@"appending = %c", [givenStr characterAtIndex:a]);
                    [strWithNoRepeatition appendString:[NSString stringWithFormat:@"%c", [givenStr characterAtIndex:a]]];
                    break;
                }
            }
    }
    NSLog(@"no repeatition = %@", strWithNoRepeatition);
    return strWithNoRepeatition;
}

@end
