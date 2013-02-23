//
//  iEPUtilities.h
//  Testbed
//
//  Created by Efthemios Suyat on 2/22/13.
//  Copyright (c) 2013 EfthemiosPrime. All rights reserved.
//

static NSString * const kUtilitiesVersion = @"1.1.2";
static NSString * const kAlertTitle = @"BW RSS";
static BOOL const kMessageActive = YES;

// populated from loadDidView
UITextView * messageTextView;

void trace ( NSString *format, ... );
void alertMessage ( NSString *format, ... );
NSString * flattenHTML ( NSString * html );
NSString * trimString ( NSString * string );
