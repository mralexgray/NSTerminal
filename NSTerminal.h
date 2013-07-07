
/*	
	NSTerminal.h
	NSTerminal is a simple class that can be used to ease interaction with the terminal in Objective-C OSX console programs. 
	Although Objective-C already has NSLog(), that is only useful for just that, logging. 
	NSTerminal aims to provide a simple interface to the terminal, wrapping the C++ standard library I/O functions (cin,cout,cerr). 
	Constructing an instance of NSTerminal is pointless, all methods are class.
*/

#define TINP VoidBlock(^)(NSString *typed, const char *raw)
@interface 				NSTerminal : NSObject
										//	*** Output ***
+   (void) clearBuffer;
+   (void) printBuffer;
+   (void) 			   printStringWithoutNewline : (NSS*) str;
+   (void) 					 printStringWithFormat : (NSS*) format,...;	//	A sort of Objective-C printf.
+   (void) printStringWithoutNewlineWithFormat : (NSS*) format,...;	//	Uses NSString's stringWithFormat: method for formating.
+   (void) 								  printString : (NSS*) str;			//	Print an NSString

																							// >>>  Input <<<<
+    (int) 				readInt;	// Read an integer, eg. "42"
+  (float) 	 		 readFloat;	// Read a float, eg. 4.5
+   (NSS*)			readString;	// Read an NSString of varying length until newline.
+ (NSURL*) 				readURL;	// Read a URL
+   (void) 	clearInputBlocks;
+   (void) 	   addInputBlock:(TINP)termDidReadString;
@end

















//		#import "NSInteger.h"	#include <stdint.h>
