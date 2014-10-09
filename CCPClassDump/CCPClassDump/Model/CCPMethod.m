//
//  CCPMethod.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPMethod.h"


@interface CCPMethod()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) CCPVariableType *returnValueType;
@property (strong, nonatomic, readwrite) NSArray *argumentTypes;

@end


@implementation CCPMethod


- (id)initWithName:(NSString*)name
   returnValueType:(CCPVariableType*)returnValueType
     argumentTypes:(NSArray*)argumentTypes {
    if (self = [super init]) {
        [self setName:name];
        [self setReturnValueType:returnValueType];
        [self setArgumentTypes:argumentTypes];
    }
    return self;
}


+ (instancetype)methodWithName:(NSString*)name
               returnValueType:(CCPVariableType*)returnValueType
                 argumentTypes:(NSArray*)argumentTypes {
    return [[[self class] alloc] initWithName:name
                              returnValueType:returnValueType
                                argumentTypes:argumentTypes];
}


@end
