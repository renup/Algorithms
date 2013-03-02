//
//  StringOperations.m
//  Algorithms
//
//  Created by Anil Punjabi on 2/23/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "StringOperations.h"

@interface StringOperations(){
    NSMutableString * sortedStr;
    NSMutableDictionary * dictOfLetters;
    NSMutableArray * dictionaryItems;
    NSString * originalRightString;
    NSString * originalLeftString;
    BOOL oneTimeOnly;

}

@property (nonatomic, copy) NSMutableString * mainAlteredStr;

@end

@implementation StringOperations

@synthesize mainAlteredStr;

-(id)initWithLength:(NSString *) inputStr {

    sortedStr = [[NSMutableString alloc] init];
    dictOfLetters = [[NSMutableDictionary alloc] init];
    dictionaryItems = [[NSMutableArray alloc] init];
    originalRightString = [[NSString alloc] init];
    originalLeftString = [[NSString alloc] init];
    oneTimeOnly = TRUE;
    return self;
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

-(NSString *)temperoryStringHolder:(NSString *)rightString{
    return rightString;
}

-(NSString *)temperoryLeftStringHolder:(NSString *)leftString{
    return leftString;
}


-(NSString *)quickSortTheString: (NSString *)orignalStr {
    NSMutableString * rightStr = [[NSMutableString alloc] init];
    NSMutableString * leftStr = [[NSMutableString alloc] init];
    int totalLengthOfString = orignalStr.length;
    int middleNumber;
    
    if (totalLengthOfString % 2) {
        middleNumber = (totalLengthOfString +1)/2 ; //odd
    }else{
        middleNumber = (totalLengthOfString +2)/2 ; //even
    }
    char pivot = [orignalStr characterAtIndex:(middleNumber-1)];

    if (pivot == ' ') {
        pivot = [orignalStr characterAtIndex:middleNumber];
    }
    for (int i =0; i< totalLengthOfString; i++) {
        NSLog(@"char = %c", [orignalStr characterAtIndex:i]);
        if ([orignalStr characterAtIndex:i]  > pivot  ) {
                [rightStr appendFormat:@"%@",[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:i]]];

        }else if([orignalStr characterAtIndex:i] == ' ' || [orignalStr characterAtIndex:i] == pivot ){
           //do nothing
        }else{
                    [leftStr appendFormat:@"%@",[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:i]]];
        }
    }
   
    int pos = leftStr.length;
    [dictOfLetters setValue:[NSNumber numberWithInt:pos] forKey:[NSString stringWithFormat:@"%c", pivot]];

   
    if (leftStr.length ==1 || rightStr.length ==1) {
        if (leftStr.length ==1) {
            [dictOfLetters setValue:[NSNumber numberWithInt:(pos -1)] forKey:[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:(pos -1)]]];
            [leftStr stringByReplacingCharactersInRange:NSMakeRange((pos -1), 1) withString:@""];
        }else{
            [dictOfLetters setValue:[NSNumber numberWithInt:(pos +1)] forKey:[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:(pos +1)]]];
            [rightStr stringByReplacingCharactersInRange:NSMakeRange(pos, 1) withString:@""];
        }
    }
    
    if (leftStr.length <1) {
        [dictOfLetters setValue:[NSNumber numberWithInt:(pos -1)] forKey:[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:pos]]];
    }
    
    if (leftStr.length>= 1 || rightStr.length >= 1) {
        if (oneTimeOnly) {
            originalRightString = [self temperoryStringHolder:rightStr];
            oneTimeOnly = FALSE;
        }
    }
    
    if (leftStr.length >1) {
        [self quickSortTheString:leftStr];
    }
    
    if(originalRightString.length>1){
        oneTimeOnly = TRUE;
        [self quickSortTheString:originalRightString];
    }
    
    NSMutableArray * tempArr = [[NSMutableArray alloc] init];
    for(NSNumber * test in [dictOfLetters allValues]){
        [tempArr addObject:test];
    }
    [tempArr sortUsingSelector: @selector(compare:)];
    
    for(NSNumber * sortedNumber in tempArr){
        NSArray * letter = [dictOfLetters allKeysForObject:sortedNumber];
        [sortedStr appendFormat:@"%@", [NSString stringWithFormat:@"%@",[letter objectAtIndex:0]]];
    }
    
return  sortedStr;
}

@end
