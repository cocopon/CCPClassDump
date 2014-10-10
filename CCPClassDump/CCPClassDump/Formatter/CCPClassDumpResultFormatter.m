//
//  CCPClassDumpResultFormatter.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/10.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPClassDumpResultFormatter.h"


@implementation CCPClassDumpResultFormatter


+ (instancetype)formatter {
    static CCPClassDumpResultFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[[self class] alloc] init];
    });
    return formatter;
}


- (NSString*)stringFromResult:(CCPClassDumpResult*)result {
    return nil;
}


@end
