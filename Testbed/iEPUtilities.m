//
//  iEPUtilities.m
//  Testbed
//
//  Created by Efthemios Suyat on 2/22/13.
//  Copyright (c) 2013 EfthemiosPrime. All rights reserved.
//

#import "iEPUtilities.h"


// for testing -- send a message (with c-ish va_args format) to a text view
void trace ( NSString *format, ... ) {
    if (!kMessageActive) return;
    va_list args;
    va_start(args, format);
    
    // we don't have a text view -- use NSLog instead
    if(!messageTextView) {
        NSLogv(format, args);
        va_end(args);
        return;
    };
    
    NSString *outstr = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    if([messageTextView.text length]) {
        messageTextView.text = [messageTextView.text stringByAppendingString:@"\n"];
        messageTextView.text = [messageTextView.text stringByAppendingString: outstr];
    } else {
        messageTextView.text = outstr;
    }
    [messageTextView scrollRangeToVisible:(NSRange) { [messageTextView.text length], 1 }];
}

// convenient for alert messages, with variadic format
void alertMessage ( NSString *format, ... ) {
    va_list args;
    va_start(args, format);
    
    NSString *outstr = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:kAlertTitle
                              message:outstr delegate:nil
                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}

// remove XML/HTML from a string
NSString * flattenHTML ( NSString * html ) {
    NSScanner *scanner;
    NSString *text = nil;
    
    if(html == nil) return @"";
    scanner = [NSScanner scannerWithString:html];
    while ([scanner isAtEnd] == NO) {
        [scanner scanUpToString:@"<" intoString:NULL] ;
        [scanner scanUpToString:@">" intoString:&text] ;
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text] withString:@" "];
    }
    return html;
}

// strip leading and trailing characters
// returns new string
NSString * trimString ( NSString * string ) {
    return [string stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}