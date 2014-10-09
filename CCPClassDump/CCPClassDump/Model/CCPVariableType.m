//
//  CCPVariableType.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPVariableType.h"


@interface CCPVariableType()

@property (strong, nonatomic, readwrite) NSString *type;

@end


@implementation CCPVariableType


- (id)initWithType:(NSString*)type {
    if (self = [super init]) {
        [self setType:type];
    }
    return self;
}


+ (instancetype)variableTypeWithType:(NSString*)type {
    return [[[self class] alloc] initWithType:type];
}


@end
