//
//  ReaderClient.h
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreClient.h"

@interface ReaderClient : NSObject <CoreClient>

-(NSString*)sendRequest: (NSString*)imageName;




@end
