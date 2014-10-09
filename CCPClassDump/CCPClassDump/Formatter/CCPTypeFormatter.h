//
//  CCPTypeFormatter.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCPVariableType;


@interface CCPTypeFormatter : NSObject

+ (NSString*)stringFromType:(CCPVariableType*)type;

@end
