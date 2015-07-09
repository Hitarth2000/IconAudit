//
//  SharedFunction.h
//  IconAudit
//
//  Created by AMS on 09/07/15.
//  Copyright (c) 2015 Hitarth. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface SharedFunction : NSObject 
{

}

+ (SharedFunction *) getSingleTon;

+ (void) showAlertWithTitle:(NSString *) title andMsg:(NSString *) msg;

@end
