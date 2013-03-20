//
//  Server.m
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import "Server.h"

@interface Server() {
    NSString * syncObj;
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
    
    self.imagesArray = [[NSMutableArray alloc] initWithArray:imageNamesArr];    
}

-(NSString*) receivedRequest:(NSString *)imageRequest{
//    @synchronized (syncObj){
        NSString * requestType = [imageRequest substringWithRange: NSMakeRange (0, 3)];
    
        if ([requestType isEqualToString:@"GET"]) {
            NSString * num = [imageRequest substringWithRange:NSMakeRange(4, 1)];
            NSString * imageName = [imagesArray objectAtIndex:[num intValue]];
            return imageName;
        }else{
            [imagesArray addObject:imageRequest];
            return @"Added image";
        }
   // }
}



@end
