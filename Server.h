//
//  Server.h
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import <Foundation/Foundation.h>
//static NSMutableArray * imagesArray;

@interface Server : NSObject{
}


+ (Server *) getSharedServerObj;

-(NSString*) receivedRequest:(NSString *)imageRequest;
-(void)initArray;
@end
