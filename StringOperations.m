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
//    NSMutableString * rightStr;
//    NSMutableString * leftStr;
}

@end

@implementation StringOperations

-(id)initWithLength:(NSString *) inputStr {
    sortedStr = [[NSMutableString alloc] initWithCapacity: inputStr.length];
 //   sortedStr = [[NSMutableString alloc] initWithCapacity: 50];

//    leftStr = [[NSMutableString alloc] init];
//    rightStr = [[NSMutableString alloc] init];
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
            [newStr appendFormat:[NSString stringWithFormat:@"%c", letter]];
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
                    [mutableStr appendFormat:[NSString stringWithFormat:@"%c", [inputString characterAtIndex:j]]];
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


-(NSString *)quickSortTheString: (NSString *)orignalStr {
    NSMutableArray * holder = [[NSMutableArray alloc] init];
    NSMutableString * rightStr = [[NSMutableString alloc] init];
    NSMutableString * leftStr = [[NSMutableString alloc] init];
    int j = (arc4random() % orignalStr.length);
    char piv = [orignalStr characterAtIndex: j ];

    while (piv == ' ') {
        piv = [orignalStr characterAtIndex: (arc4random() % orignalStr.length) ];
    }
   
    NSLog(@" pivot = : %c", piv);
    for (int i =0; i< orignalStr.length; i++) {
        if ([orignalStr characterAtIndex:i]  > piv  ) {
            [rightStr appendFormat:[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:i]]];
        }else if([orignalStr characterAtIndex:i] == ' '){
            [holder addObject:[NSNumber numberWithInt:i]];
            //[sortedStr insertString:[NSString stringWithFormat:@"%c", ' '] atIndex:i];
        }
        else if(piv == [orignalStr characterAtIndex:i]){
            
        }else{
            [leftStr appendFormat:[NSString stringWithFormat:@"%c", [orignalStr characterAtIndex:i]]];
        }
    }
    NSLog(@"left = %@  right = %@", leftStr, rightStr);
    
    [sortedStr appendString:leftStr];
//    [sortedStr appendString:[NSString stringWithFormat:@"%c", piv]];
//    [sortedStr appendString:rightStr];
//    int leftLen = leftStr.length;
    [sortedStr insertString:[NSString stringWithFormat:@"%c", piv] atIndex:(leftStr.length +1)];
    while (leftStr.length >1) {
        if (leftStr.length ==1) {
            break;
        }else{
            [self quickSortTheString:leftStr]; 
        }
    }
    while (rightStr.length >1) {
        if (rightStr.length ==1) {
            break;
        }else{
            [self quickSortTheString:rightStr]; 
        }
    }
    
    for (int g =0; g< [holder count]; g++) {
        [sortedStr insertString:[NSString stringWithFormat:@"%c", ' '] atIndex: [[holder objectAtIndex:g] intValue]];
    }
    
    NSLog(@"Sorted str = %@", sortedStr);
//    [leftStr appendString:rightStr];
    return sortedStr;
}
    

@end
