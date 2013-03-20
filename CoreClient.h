//
//  CoreClient.h
//  Algorithms
//
//  Created by Renu P on 3/17/13.
//  Copyright (c) 2013 Renu Punjabi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoreClient <NSObject>

@required
-(NSString*)sendRequest: (NSString*)imageName;

@end
