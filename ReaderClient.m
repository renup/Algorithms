//
//  ReaderClient.m
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "ReaderClient.h"
#import "Server.h"

@implementation ReaderClient

-(NSString*)sendRequest: (NSString*)imageNum {
    Server * serverObj = [Server getSharedServerObj];
    NSString *imageReceived = [serverObj receivedRequest:imageNum];
    NSLog(@"imageReceived = %@", imageReceived);
    return imageReceived;
}

@end
