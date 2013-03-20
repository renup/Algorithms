//
//  ViewController.m
//  Algorithms
//
//  Created by Anil Punjabi on 2/23/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "ViewController.h"
#import "StringOperations.h"
#import "ClientManager.h"
#import "SemaphoreManager.h"

@interface ViewController (){
    StringOperations *so;
    NSMutableString * letterForDices;
    UILabel * dice1;
    UILabel * dice2;
    
    NSObject * syncObj;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
 //   letterForDices = @"YNEIAUGTMLKEZODHRSLCVAFTREGNQPOHUWCDBXFIABJPTSMO";
//    @synchronize (letterForDices);
//    [letterForDices setString: @"YNE"];
    letterForDices = [[NSMutableString alloc] init];
    [letterForDices appendString:@"ABCDEFG"];

//    SemaphoreManager *sm = [[SemaphoreManager alloc] init];
//    [sm createMultipleReaders];
 
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
    
    dice1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    dice1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:dice1];
    
    dice2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 50)];
    dice2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:dice2];
    
    ClientManager * clientManager = [[ClientManager alloc] init];
    [clientManager createClientThreads];
    
    
    // run a thread and call the method: threadingDiceLetters:btn1
//    NSThread * thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadingDiceLetters:) object:dice1]; 
//    [thread1 start];
//
//    // run a thread and call the method: threadingDiceLetters:btn2
//    NSThread * thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(threadingDiceLetters:) object:dice2];
//    [thread2 start];
    dice1.text = @"";
    dice2.text = @"";
    
//    
//    NSThread * thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(practiceSynchronization:) object:dice1];
//    [thread1 setName:@"FirstThread"];
//    [thread1 start];
//    
//    // run a thread and call the method: threadingDiceLetters:btn2
//    NSThread * thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(practiceSynchronization:) object:dice2];
//    [thread2 setName:@"SecondThread"];
//    [thread2 start];

}

-(void) threadingDiceLetters: (UILabel*)diceReceived {
    
//    NSLog(@"making thread");
    
    int randomForLoopInt = (arc4random() % letterForDices.length) +1;
    
    for (int i =0; i< randomForLoopInt; i++) {
        int randomInt = (arc4random() % letterForDices.length);
        char letter = [letterForDices characterAtIndex:randomInt];
        diceReceived.text = [NSString stringWithFormat:@"%c", letter];
        NSLog(@"letter = %@", diceReceived.text);
     //   sleep(4.0);
    }
    
    while ([dice1.text isEqualToString:dice2.text]) {
        NSLog(@"dice1 = %@,   dice2 =  %@", dice1.text, dice2.text);
        randomForLoopInt = (arc4random() % letterForDices.length);
        dice1.text = [NSString stringWithFormat:@"%c", [letterForDices characterAtIndex:(randomForLoopInt)]];
    }
    NSLog(@" final dice1 = %@,   final dice2 =  %@", dice1.text, dice2.text);
    
}


//A very nice article on @synchronized : http://refactr.com/blog/2012/10/ios-tips-synchronized/

-(void)practiceSynchronization: (UILabel*)diceReceived {
    int randomForLoopInt = (arc4random() % 48) +1;
    int randomInt;
    
    for (int i =0; i< randomForLoopInt; i++) {
       @synchronized(syncObj){
//        @synchronized(diceReceived){

            if (letterForDices.length <= 1)
                randomInt = 0;
            else
                randomInt = (arc4random() % (letterForDices.length -1));
           
            NSString * prevStr = diceReceived.text;
            diceReceived.text = [NSString stringWithFormat:@"%c", [letterForDices characterAtIndex:randomInt]];
            [letterForDices deleteCharactersInRange:NSMakeRange(randomInt, 1)];
            [letterForDices appendString:prevStr];
            NSLog(@"Thread=%@, letter = %@", [NSThread currentThread].name, diceReceived.text);
        };
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
