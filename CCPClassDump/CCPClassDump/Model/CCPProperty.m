//
//  CCPProperty.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPProperty.h"


@interface CCPProperty()

@property (strong, nonatomic, readwrite) NSString *name;

@end


@implementation CCPProperty


- (id)initWithName:(NSString*)name {
    if (self = [super init]) {
        [self setName:name];
    }
    return self;
}


+ (instancetype)propertyWithName:(NSString*)name {
	return [[[self class] alloc] initWithName:name];
}


@end
