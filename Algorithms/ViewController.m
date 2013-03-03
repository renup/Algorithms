//
//  ViewController.m
//  Algorithms
//
//  Created by Anil Punjabi on 2/23/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "ViewController.h"
#import "StringOperations.h"

@interface ViewController (){
    StringOperations *so;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    so = [[StringOperations alloc] init];
    NSString * str = [so reverseString:@"AB"];
    NSLog(@"This is : %@", str);
    
   NSString * str2 = [so replaceVowels:@"This is a string" : 'd'];
    NSLog(@"This is : %@", str2);
    
    int finalResult = [so factorialOfNumber:5];
    NSLog(@"Factorial result = %i", finalResult);
    
//    NSString *sortedStr = [so quickSortTheString:@"quick sort"];
//    NSLog(@"This is : %@", sortedStr);
    
    NSString * try = [so quickSortTrial:@"quick"];
    NSLog(@"quick sort = %@", try);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
