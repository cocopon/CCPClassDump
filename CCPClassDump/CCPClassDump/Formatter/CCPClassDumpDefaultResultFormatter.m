//
//  CCPClassDumpDefaultResultFormatter.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "CCPClassDumpDefaultResultFormatter.h"
#import "CCPClassDumpResult.h"
#import "CCPMethod.h"
#import "CCPProperty.h"
#import "CCPTypeFormatter.h"
#import "CCPVariableType.h"


static NSString *const kMethodSeparator = @":";


@implementation CCPClassDumpDefaultResultFormatter


- (NSString*)prefixForResult:(CCPClassDumpResult*)result {
    NSMutableString *str = [NSMutableString string];

	// Class
	[str appendFormat:@"@interface %@",
	 [result className]];

	// Super class
	if ([result superClassName] != nil) {
		[str appendFormat:@" : %@",
         [result superClassName]];
	}

    // Protocols
    if ([result.protocolNames count] > 0) {
        [str appendFormat:@"<%@>",
         [result.protocolNames componentsJoinedByString:@", "]];
    }

	[str appendString:@"\n"];

    return str;
}


- (NSString*)postfixForResult:(CCPClassDumpResult*)result {
	return @"@end";
}


- (NSString*)stringFromMethod:(CCPMethod*)method {
	NSMutableString *result = [NSMutableString string];

	NSArray *nameComps = [method.name componentsSeparatedByString:kMethodSeparator];
	NSUInteger totalNameComps = [nameComps count];

	// Return value
	[result appendFormat:@"(%@)",
	 [CCPTypeFormatter stringFromType:[method returnValueType]]];

	// Arguments
	NSUInteger totalArgTypes = [method.argumentTypes count];
	if (totalArgTypes == 0) {
		[result appendString:[nameComps firstObject]];
		return result;
	}

	NSMutableArray *argStrs = [NSMutableArray array];
	NSString *argStr;
	NSString *nameComp;
	NSInteger i = 0;
    for (CCPVariableType *argType in [method argumentTypes]) {
		nameComp = (i < totalNameComps)
    		? [nameComps objectAtIndex:i]
    		: @"";
		argStr = [NSString stringWithFormat:@"%@:(%@)arg%zd",
				  nameComp,
				  [CCPTypeFormatter stringFromType:argType],
				  i + 1];
		[argStrs addObject:argStr];

		++i;
	}
	[result appendString:[argStrs componentsJoinedByString:@" "]];
	return result;
}


- (NSString*)stringFromClassMethod:(CCPMethod*)method {
    return [NSString stringWithFormat:@"+ %@;\n",
            [self stringFromMethod:method]];
}


- (NSString*)stringFromInstanceMethod:(CCPMethod*)method {
    return [NSString stringWithFormat:@"- %@;\n",
            [self stringFromMethod:method]];
}


- (NSString*)stringFromProperty:(CCPProperty*)property {
    return [NSString stringWithFormat:@"@property (?) ? %@;\n",
            [property name]];
}


- (NSString*)stringFromResult:(CCPClassDumpResult*)result {
    NSMutableString *str = [NSMutableString string];

    [str appendString:[self prefixForResult:result]];

    for (CCPProperty *prop in [result properties]) {
        [str appendString:[self stringFromProperty:prop]];
    }
    for (CCPMethod *method in [result classMethods]) {
        [str appendString:[self stringFromClassMethod:method]];
    }
    for (CCPMethod *method in [result instanceMethods]) {
        [str appendString:[self stringFromInstanceMethod:method]];
    }

    [str appendString:[self postfixForResult:result]];

    return str;
}


@end
