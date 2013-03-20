//
//  SemaphoreManager.m
//  Algorithms
//
//  Created by Renu P on 3/19/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "SemaphoreManager.h"

@interface SemaphoreManager(){
    dispatch_semaphore_t my_semaphore;
}

@end

@implementation SemaphoreManager

-(void)createMultipleReaders {
    // Create the semaphore, specifying the initial pool size
    my_semaphore = dispatch_semaphore_create(4);
    for (int i = 0; i< 20; i++) {
        NSThread * thread = [[NSThread alloc] initWithTarget:self selector:@selector(manageSemaphore:) object:nil];
        [thread setName:[NSString stringWithFormat:@"Thread%i", i]];
        [thread start];
    }
}

-(void)manageSemaphore:(NSNumber *)currentThread {
   
    
    // Next we will use the semaphore wherever we need to start using threads. This line means that any thread which enters in the critical part of the method has to first obtain the semaphore
    dispatch_semaphore_wait(my_semaphore, DISPATCH_TIME_FOREVER);
    
    // Next we will run our critical code in this block
    // Automatically only 4 threads will be able to reach this part of the code -- because we've set the semaphore to allow only 4 threads during initialization.
    NSLog(@"Current Thread started = %@", [NSThread currentThread].name);
    sleep(5);
    
    NSLog(@"Current Thread ended = %@", [NSThread currentThread].name);
    
    // FInally we will release the semaphore.
    dispatch_semaphore_signal(my_semaphore);
}

@end
