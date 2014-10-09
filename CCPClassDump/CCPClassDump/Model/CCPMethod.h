//
//  CCPMethod.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CCPVariableType;


@interface CCPMethod : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) CCPVariableType *returnValueType;
@property (strong, nonatomic, readonly) NSArray *argumentTypes;

+ (instancetype)methodWithName:(NSString*)name
               returnValueType:(CCPVariableType*)returnValueType
                 argumentTypes:(NSArray*)argumentTypes;

@end
