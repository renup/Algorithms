//
//  WriterClient.m
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "WriterClient.h"
#import "Server.h"

@implementation WriterClient

-(NSString*)sendRequest: (NSString*)imageName {
    Server * serverObj = [Server getSharedServerObj];
    NSString *status = [serverObj receivedRequest:imageName];
    NSLog(@"status = %@", status);
    return status;
}

@end
