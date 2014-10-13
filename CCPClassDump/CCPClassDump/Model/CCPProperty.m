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
@property (strong, nonatomic, readwrite) NSString *attributesString;

@end


@implementation CCPProperty


- (instancetype)initWithName:(NSString*)name attributesString:(NSString*)attributes {
    if (self = [super init]) {
        [self setName:name];
		[self setAttributesString:attributes];
    }
    return self;
}


+ (instancetype)propertyWithName:(NSString*)name attributesString:(NSString*)attributes {
	return [[[self class] alloc] initWithName:name
							 attributesString:attributes];
}


@end
