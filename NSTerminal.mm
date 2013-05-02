//
//  NSTerminal.m
//  NSTerminal
//
//  Created by A on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "NSTerminal.h"


#include <iostream.h>
#include <string.h>
#include <stdio.h>
using namespace std;

@implementation NSTerminal																			//----Output

+   (void) printString:									(NSString*)str				{ cout<<[str UTF8String]<<endl;	}	
+   (void) printStringWithoutNewline:				(NSString*)str				{ cout<<[str UTF8String];
}
+   (void) printStringWithFormat:					(NSString*)format, ...	{
    va_list args;
    va_start(args, format);
    cout << [[[NSString alloc] initWithFormat:format arguments:args] UTF8String] << endl;
    va_end(args);
}
+   (void) printStringWithoutNewlineWithFormat: (NSString*)format, ...	{
    va_list args;
    va_start(args, format);
    cout << [[[NSString alloc] initWithFormat:format arguments:args] UTF8String] << endl;
    va_end(args);
}

+    (int) readInt		{ 

	int   res = 0;
	while(!(cin >> res)){
		cin.clear();
		cin.ignore(numeric_limits<streamsize>::max(), '\n');
		cout << "Invalid input.  Try again: ";
	}
	return   (int)res; //	cin>>res; 	cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}																		//----Input
+  (float) readFloat 	{ float res; cin>>res; cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); return (float)res; }

+   (NSS*) readString	{ string res; std::getline(std::cin, res); return [NSString stringWithCString:res.c_str() encoding:NSASCIIStringEncoding];	}
+ (NSURL*) readURL		{ string res; cin>>res; return [NSURL URLWithString:[NSString stringWithCString:res.c_str() encoding:NSASCIIStringEncoding]];	}
@end
