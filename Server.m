//
//  Server.m
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "Server.h"
#include "pthread.h"

@interface Server() {
//    NSString * syncObj;
//    NSLock *myThreadLock;
    pthread_mutex_t mutex;
}
@property (nonatomic, strong) NSMutableArray * imagesArray;

@end

static Server *sharedServerClassObj = NULL;
//static NSMutableArray * imagesArray;

@implementation Server
@synthesize imagesArray;

+ (Server *) getSharedServerObj
{
    if (sharedServerClassObj == nil) {
        sharedServerClassObj = [[Server alloc] init]; 
    }

    return sharedServerClassObj;
}

-(void) initArray{
    NSMutableArray * imageNamesArr = [[NSMutableArray alloc] init];
    for (int i =0; i< 10; i++) {
        NSString * imageName =[NSString stringWithFormat:@"image%i", i];
        [imageNamesArr addObject:imageName];
    }
        pthread_mutex_init(&mutex, NULL);

//    myThreadLock = [[NSLock alloc] init];
    self.imagesArray = [[NSMutableArray alloc] initWithArray:imageNamesArr];
}

// Here three ways of locking threads are shown- Synchronization, using pthreads and NSLock. All of them serve the same purpose of synchronizing the incoming threads in the method.
-(NSString*) receivedRequest:(NSString *)imageRequest{
//    @synchronized (syncObj){
    
    NSString * requestType = [imageRequest substringWithRange: NSMakeRange (0, 3)];
    
        if ([requestType isEqualToString:@"GET"]) {
            NSString * num = [imageRequest substringWithRange:NSMakeRange(4, 1)];
            NSString * imageName = [imagesArray objectAtIndex:[num intValue]];
            return imageName;
        }else{
//            @synchronized (syncObj){
//            [myThreadLock lock];
            pthread_mutex_lock(&mutex);

            [imagesArray addObject:imageRequest];
            usleep(2);
            pthread_mutex_unlock(&mutex);
//            [myThreadLock unlock];
            return @"Added image";

            }

}



@end
