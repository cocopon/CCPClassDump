//
//  CCPProperty.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCPVariableType;


@interface CCPProperty : NSObject

// TODO: Support type and attributes
@property (strong, nonatomic, readonly) NSString *name;

+ (instancetype)propertyWithName:(NSString*)name;

@end
