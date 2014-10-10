//
//  CCPClassDumpUtil.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/10.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPClassDumpUtil.h"
#import "CCPClassDump.h"
#import "CCPClassDumpDefaultResultFormatter.h"


NSString *CCPStringFromClassDump(Class klass) {
	CCPClassDumpResult *result = [CCPClassDump dumpClass:klass];
	CCPClassDumpResultFormatter *formatter = [CCPClassDumpDefaultResultFormatter formatter];
	return [formatter stringFromResult:result];
}