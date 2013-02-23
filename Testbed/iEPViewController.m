//
//  iEPViewController.m
//  Testbed
//
//  Created by Efthemios Suyat on 2/22/13.
//  Copyright (c) 2013 EfthemiosPrime. All rights reserved.
//

#import "iEPViewController.h"

@interface iEPViewController ()

@end

@implementation iEPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    extern UITextView *messageTextView;
    messageTextView = textView;
    
    textView.font = [ UIFont systemFontOfSize:12];
    
    [self runTest];
    
}

- (void) runTest {
    trace(@"Testbed version %@", kTestbedVersion);
    
    for (id o in @[@"klaatu", @"baradu", @"nikto"]) {
        trace(@"object is %@", o);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
