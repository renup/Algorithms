//
//  ClientManager.m
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "ClientManager.h"
#import "WriterClient.h"
#import "ReaderClient.h"
#import "Server.h"

@interface ClientManager(){
}

@end

@implementation ClientManager

-(void)createClientThreads {
    
    Server * serverObj = [Server getSharedServerObj];
    [serverObj initArray];
    
    //To make multiple writers work with multiple writers
    for (int i = 0; i< 10; i++) {
    WriterClient * writerObj = [[WriterClient alloc] init];
    int randomInt = (arc4random() % 100) +1;
    NSThread * writerThread = [[NSThread alloc] initWithTarget:writerObj selector:@selector(sendRequest:) object:[NSString stringWithFormat:@"PUT %i", randomInt]];
    [writerThread setName:@"writerThread"];
    [writerThread start];
    }
    
    for (int i = 0; i< 10; i++) {
        ReaderClient * readerObj = [[ReaderClient alloc] init];
        NSThread * thread = [[NSThread alloc] initWithTarget:readerObj selector:@selector(sendRequest:) object:[NSString stringWithFormat:@"GET %i", i]];
        [thread setName:[NSString stringWithFormat:@"Thread%i", i]];
        [thread start];        
    }
}



@end
