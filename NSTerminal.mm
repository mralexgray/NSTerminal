
#import "NSTerminal.h"

#include <iostream>
#include <string.h>
#include  <stdio.h>
using namespace std;
static NSMA *blocks = nil; NSMS* buffer = nil; static BOOL inBlockCallback = NO;
#define BUFFER(x) buffer = buffer ?: [NSMS new], [buffer appendString:([buffer isEqualToString:x]) ? @"" : x], x

@implementation NSTerminal

+   (void) printString:									(NSS*)str			{ cout<<[BUFFER(str) UTF8String]<<endl;	}		//----Output
+   (void) printStringWithoutNewline:				(NSS*)str			{ cout<<[BUFFER(str) UTF8String];			}
+   (void) printStringWithFormat:					(NSS*)format, ...	{
    va_list args;
    va_start(args, format);
    cout << [BUFFER([NSString.alloc initWithFormat:format arguments:args]) UTF8String] << endl;
    va_end(args);
}
+   (void) printStringWithoutNewlineWithFormat: (NSS*)format, ...	{
    va_list args;
    va_start(args, format);
    cout << [BUFFER([NSString.alloc initWithFormat:format arguments:args]) UTF8String] << endl;
    va_end(args);
}
+   (void) clearInputBlocks 													{ 	blocks = nil; blocks = [NSMA new]; }
+   (void) addInputBlock:(TINP)termDidReadString						{ if (!termDidReadString) return;  if (!blocks) blocks = [NSMA new]; [blocks addObject:termDidReadString]; }
+   (void) clearBuffer 															{ buffer = [NSMS new]; }
+   (void) printBuffer 															{ [self printString:buffer]; }
+    (int)    readInt 	{ 		int   res = 0;
	while(!(cin >> res))	{		
		cin.clear();		
		cin.ignore(numeric_limits<streamsize>::max(), '\n');	
		cout << "Invalid input.  Try again: ";	
	}
	if  (blocks.count) {
		for( VoidBlock(^_readBlock)(NSS* userInput, const char* raw) in blocks) {
			VoidBlock k = _readBlock([NSString stringWithFormat:@"%i", res], @encode(typeof(int)));
			if (k != nil) {   k(); }
		}
	}
	return   (int)res;
	//	cin>>res; 	cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}			//----Input
+  (float)  readFloat 	{ float res; 
	cin>>res; 
	cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); 
	if (blocks) { for (NSS*(^_readBlock)(NSS* userInput, const char* raw) in blocks) _readBlock([NSString stringWithFormat:@"%f", res], @encode(typeof(float))); }
	return (float)res; 
}
+   (NSS*) readString	{

	string res; 		//fprintf(stderr, "readingstdin!");
	std::getline(std::cin, res); 
	NSString * nsstring = [NSString stringWithCString:res.c_str() encoding:NSASCIIStringEncoding];
	if  (blocks.count) {
		for( VoidBlock(^_readBlock)(NSS* userInput, const char* raw) in blocks) {
	 	 VoidBlock j = _readBlock(nsstring, @encode(typeof(string)));
		 if (j) { j(); }
		}
	}
	return nsstring;
//	[self readString];
//	//, nsstring;
}
+ (NSURL*)    readURL	{ string res; 

	cin>>res; 
	NSString *nsstring = [NSString stringWithCString:res.c_str() encoding:NSASCIIStringEncoding];
//	if (_readBlock) _readBlock(nsstring, @encode(typeof(NSURL)));
	return [NSURL URLWithString:nsstring];	
}

//+   (void) setTermDidReadString:(termDidReadString)block { _readBlock = block; }

@end
