//
//  CCPClassDumpResultFormatter.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>


@class CCPClassDumpResult;


@interface CCPClassDumpResultFormatter : NSObject

+ (instancetype)formatter;
- (NSString*)stringFromResult:(CCPClassDumpResult*)result;

@end
