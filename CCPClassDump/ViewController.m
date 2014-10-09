//
//  ViewController.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/09.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "ViewController.h"
#import "CCPClassDump.h"
#import "CCPClassDumpResultFormatter.h"


#define kTargetClass [UITextField class]


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	
	CCPClassDumpResult *result = [CCPClassDump dumpClass:kTargetClass];
	CCPClassDumpResultFormatter *formatter = [CCPClassDumpResultFormatter formatter];
	[self.textView setText:[formatter stringFromResult:result]];
}


@end
