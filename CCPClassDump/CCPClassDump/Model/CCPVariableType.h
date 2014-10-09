//
//  CCPVariableType.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CCPVariableType : NSObject

+ (instancetype)variableTypeWithType:(NSString*)type;

@property (strong, nonatomic, readonly) NSString *type;

@end
