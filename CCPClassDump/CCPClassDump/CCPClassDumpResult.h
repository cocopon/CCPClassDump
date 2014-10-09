//
//  CCPDumpResult.h
//  CCPClassDump
//
//  Created by cocopon on 2014/10/07.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CCPClassDumpResult : NSObject

@property (strong, nonatomic) NSString *className;
@property (strong, nonatomic) NSString *superClassName;
@property (strong, nonatomic) NSArray *protocolNames;
@property (strong, nonatomic) NSArray *classMethods;
@property (strong, nonatomic) NSArray *instanceMethods;
@property (strong, nonatomic) NSArray *properties;

@end
