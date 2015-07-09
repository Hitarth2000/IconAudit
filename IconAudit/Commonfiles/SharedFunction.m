//
//  SharedFunction.m
//  IconAudit
//
//  Created by AMS on 09/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//

#import "SharedFunction.h"

@implementation SharedFunction

static SharedFunction *sharedObj = nil;

+ (SharedFunction *) getSingleTon
{
    if (sharedObj == nil)
    {
        sharedObj = [[SharedFunction alloc] init];
    }
    return sharedObj;
}



@end
