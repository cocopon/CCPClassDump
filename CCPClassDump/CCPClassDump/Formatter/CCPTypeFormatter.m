//
//  CCPTypeFormatter.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPTypeFormatter.h"
#import "CCPVariableType.h"


static NSDictionary *__typeDict;


@implementation CCPTypeFormatter


+ (void)initialize {
	// See Type Endodings section in Objective-C Tuntime Programming Guide:
	// https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100
	NSMutableDictionary *typeDict = [NSMutableDictionary dictionary];
	[typeDict setObject:@"char" forKey:@"c"];
	[typeDict setObject:@"int" forKey:@"i"];
	[typeDict setObject:@"short" forKey:@"s"];
	[typeDict setObject:@"long" forKey:@"l"];
	[typeDict setObject:@"long long" forKey:@"q"];
	[typeDict setObject:@"unsigned char" forKey:@"C"];
	[typeDict setObject:@"unsigned int" forKey:@"I"];
	[typeDict setObject:@"unsigned short" forKey:@"S"];
	[typeDict setObject:@"unsigned long" forKey:@"L"];
	[typeDict setObject:@"unsigned long long" forKey:@"Q"];
	[typeDict setObject:@"float" forKey:@"f"];
	[typeDict setObject:@"double" forKey:@"d"];
	[typeDict setObject:@"bool" forKey:@"B"];
	[typeDict setObject:@"void" forKey:@"v"];
	[typeDict setObject:@"char*" forKey:@"*"];
	[typeDict setObject:@"id" forKey:@"@"];
	[typeDict setObject:@"Class" forKey:@"#"];
	[typeDict setObject:@"CGSize" forKey:@"{CGSize=dd}"];
	[typeDict setObject:@"CGRect" forKey:@"{CGRect={CGPoint=dd}{CGSize=dd}}"];
	[typeDict setObject:@"CGPoint" forKey:@"{CGPoint=dd}"];
	[typeDict setObject:@"NSRange" forKey:@"{_NSRange=QQ}"];
	__typeDict = typeDict;
}


+ (NSString*)stringFromType:(CCPVariableType*)type {
	if ([type.type length] > 0 && [type.type characterAtIndex:0] == '^') {
		// "^type": a pointer to type
        CCPVariableType *pointedType = [CCPVariableType variableTypeWithType:[type.type substringFromIndex:1]];
		return [NSString stringWithFormat:@"%@*",
                [self stringFromType:pointedType]];
	}

	NSString *result = [__typeDict objectForKey:[type type]];
	return (result != nil) ? result : [type type];
}


@end
