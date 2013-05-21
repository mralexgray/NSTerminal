//
//  NSTerminal.h
//  NSTerminal
//
//  Created by A on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//Objective-C imports

#import <Foundation/Foundation.h>
//#import "NSInteger.h"
//#include <stdint.h>
/*
 NSTerminal is a simple class that can be used to ease interaction with the terminal in Objective-C OSX console programs. Although Objective-C 
 already has NSLog(), that is only useful for just that, logging. NSTerminal aims to provide a simple interface to the terminal, wrapping the 
 C++ standard library I/O functions (cin,cout,cerr). Constructing an instance of NSTerminal is pointless, all methods are class.
*/
@interface NSTerminal : NSObject 																			//	*** Output ***
+   (void) printStringWithFormat:					(NSS*)format,...;	//	A sort of Objective-C printf. Uses NSString's stringWithFormat: method for formating.
+   (void) printStringWithoutNewlineWithFormat:	(NSS*)format,...;
+   (void) printString:									(NSS*)str;			//	Print an NSString
+   (void) printStringWithoutNewline:				(NSS*)str;

//----Input
//Read an integer, eg. "42"
+    (int) readInt;
//Read a float, eg. 4.5
+  (float) readFloat;
//Read an NSString of varying length until newline.
+   (NSS*) readString;
//Read a URL
+ (NSURL*) readURL;
@end


