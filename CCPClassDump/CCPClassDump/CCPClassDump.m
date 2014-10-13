//
//  CCPClassDump.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <objc/runtime.h>
#import "CCPClassDump.h"
#import "CCPClassDumpResult.h"
#import "CCPMethod.h"
#import "CCPProperty.h"
#import "CCPVariableType.h"


#define NSStringFromCString(cStr) \
    [[NSString alloc] initWithCString:(cStr) \
                             encoding:NSASCIIStringEncoding]

static size_t const kTypeCharLength = 256;
static NSString *const kMethodSeparator = @":";


@implementation CCPClassDump


+ (NSArray*)argumentTypesOfMethod:(Method)method {
	unsigned int totalArgs = method_getNumberOfArguments(method);
	NSMutableArray *result = [NSMutableArray array];
	char cType[kTypeCharLength];
	NSString *typeStr;
	int i;
	for (i = 1; i < totalArgs; i++) {
		method_getArgumentType(method, i, cType, kTypeCharLength);
        typeStr = NSStringFromCString(cType);

		// Except method selector ":"
		if (![typeStr isEqualToString:kMethodSeparator]) {
			[result addObject:[CCPVariableType variableTypeWithType:typeStr]];
		}
	}

	return result;
}


+ (NSString*)nameOfMethod:(Method)method {
    SEL selector = method_getName(method);
    return NSStringFromSelector(selector);
}


+ (CCPVariableType*)returnValueTypeOfMethod:(Method)method {
    char cType[kTypeCharLength];
    method_getReturnType(method, cType, kTypeCharLength);
    NSString *typeStr = NSStringFromCString(cType);
    return [CCPVariableType variableTypeWithType:typeStr];
}


+ (CCPMethod*)ccpMethodFromMethod:(Method)method {
    // Name
    SEL selector = method_getName(method);
    NSString *name = NSStringFromSelector(selector);

    // Return value
    char cType[kTypeCharLength];
    method_getReturnType(method, cType, kTypeCharLength);
    NSString *typeStr = NSStringFromCString(cType);
    CCPVariableType *retvalType = [CCPVariableType variableTypeWithType:typeStr];

    // Arguments
    NSArray *argTypes = [self argumentTypesOfMethod:method];

    return [CCPMethod methodWithName:name
                     returnValueType:retvalType
                       argumentTypes:argTypes];
}


+ (NSArray*)protocolNamesOfClass:(Class)klass {
    unsigned int totalProtocols;
    Protocol *__unsafe_unretained *cProtocols = class_copyProtocolList(klass, &totalProtocols);

    NSMutableArray *names = [NSMutableArray array];
    Protocol *__unsafe_unretained*p = cProtocols;
    const char *cName;
    NSString *name;
    int i;
    for (i = 0; i < totalProtocols; i++) {
        cName = protocol_getName(*p);
        name = NSStringFromCString(cName);
        [names addObject:name];
        ++p;
    }

    free(cProtocols);

    return names;
}


+ (NSArray*)propertiesOfClass:(Class)klass {
    NSMutableArray *props = [NSMutableArray array];

    unsigned int totalProperties;
    objc_property_t *cProps = class_copyPropertyList(klass, &totalProperties);
    objc_property_t *p = cProps;
	const char *cName, *cAttrs;
	NSString *name, *attrs;
    CCPProperty *prop;
    int i;
    for (i = 0; i < totalProperties; i++) {
//        cType = property_copyAttributeValue(*p, "T");
//        type = NSStringFromCString(cType);
        cName = property_getName(*p);
        name = NSStringFromCString(cName);
		cAttrs = property_getAttributes(*p);
		attrs = NSStringFromCString(cAttrs);

		prop = [CCPProperty propertyWithName:name
							attributesString:attrs];
        [props addObject:prop];
        ++p;
    }

    free(cProps);

    return props;
}


+ (NSArray*)methodNamesOfClass:(Class)klass {
	unsigned int totalMethods;
	Method *cMethod = class_copyMethodList(klass, &totalMethods);
	int i;

	NSMutableArray *result = [NSMutableArray array];
	Method *m = cMethod;
	SEL selector;
	for (i = 0; i < totalMethods; i++) {
		selector = method_getName(*m);
		[result addObject:NSStringFromSelector(selector)];
		++m;
	}

	[result sortUsingComparator:	^NSComparisonResult(NSString *name1, NSString *name2) {
		return [name1 compare:name2];
	}];

	free(cMethod);

	return result;
}


+ (NSArray*)classMethodsOfClass:(Class)klass {
	NSArray *classMethodNames = [CCPClassDump methodNamesOfClass:object_getClass(klass)];
    NSMutableArray *methods = [NSMutableArray array];
    SEL selector;
    Method cMethod;
	for (NSString *methodName in classMethodNames) {
		selector = NSSelectorFromString(methodName);
		cMethod = class_getClassMethod(klass, selector);
        [methods addObject:[self ccpMethodFromMethod:cMethod]];
	}
    return methods;
}


+ (NSArray*)instanceMethodsOfClass:(Class)klass {
	NSArray *instanceMethodNames = [self methodNamesOfClass:klass];
    NSMutableArray *methods = [NSMutableArray array];
    SEL selector;
    Method cMethod;
	for (NSString *methodName in instanceMethodNames) {
		selector = NSSelectorFromString(methodName);
		cMethod = class_getInstanceMethod(klass, selector);
        [methods addObject:[self ccpMethodFromMethod:cMethod]];
	}
    return methods;
}


+ (CCPClassDumpResult*)dumpClass:(Class)klass {
    CCPClassDumpResult *result = [[CCPClassDumpResult alloc] init];
    [result setClassName:NSStringFromClass(klass)];
    [result setSuperClassName:NSStringFromClass([klass superclass])];
    [result setProtocolNames:[self protocolNamesOfClass:klass]];
    [result setClassMethods:[self classMethodsOfClass:klass]];
    [result setInstanceMethods:[self instanceMethodsOfClass:klass]];
    [result setProperties:[self propertiesOfClass:klass]];
	return result;
}


@end
