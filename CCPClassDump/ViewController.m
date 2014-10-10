//
//  ViewController.m
//  CCPClassDump
//
//  Created by cocopon on 2014/10/09.
//  Copyright (c) 2014 cocopon. All rights reserved.
//

#import "ViewController.h"
#import "CCPClassDump.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end


@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];

    NSString *result = CCPStringFromClassDump([UITextField class]);
    [self.textView setText:result];
    NSLog(@"%@", result);
}


@end
