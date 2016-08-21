//
//  main.m
//  TTTsecondtest
//
//  Created by Jesse Sahli on 5/16/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <string.h>


void checkPassword(NSString *password) {
    
    
    
    const char *passwordCString = [password cStringUsingEncoding:NSUTF8StringEncoding];
    unichar firstChar = [password characterAtIndex:0];
    NSCharacterSet * numberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet * symbolSet = [NSCharacterSet characterSetWithCharactersInString:@"#@$%&!"];
    NSCharacterSet * upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet * lowerCaseSet = [NSCharacterSet lowercaseLetterCharacterSet];
    NSMutableArray * blackList = [[NSMutableArray alloc]initWithObjects:@"A123456a#", @"X123456a@", @" a1234&@56a#", @"aaaaX1#", nil];

   for(int i = 0; i < strlen(passwordCString); i++){
        if(passwordCString[i] == passwordCString[i+1]) {
            NSLog(@"The password must not have repeating characters (ex. zz, RR, 44)");
            return;
        }
   }
    
    if ([password length] > 15)
        NSLog(@"The password needs to be less than 16 characters long");
    else if ([password length] < 8)
        NSLog(@"The password needs to be more than 8 characters long");
    else if ([password rangeOfCharacterFromSet:numberSet].location == NSNotFound)
        NSLog(@"The password needs to contain at least one number");
    else if ([password rangeOfCharacterFromSet:symbolSet].location == NSNotFound)
        NSLog(@"The password needs to contain one of the following symbols # @ $ %% & !");
    else if ([password containsString:@" "])
        NSLog(@"The password must not contain any spaces");
    else if (!(isalpha(firstChar)))
        NSLog(@"The password must begin with a letter");
    else if ([password rangeOfCharacterFromSet:upperCaseSet].location == NSNotFound)
        NSLog(@"The password must contain at least one uppercase letter");
    else if ([password rangeOfCharacterFromSet:lowerCaseSet].location == NSNotFound)
        NSLog(@"The password must contain at least one lowercase letter");
    else if ([blackList containsObject:password])
        NSLog(@"This password is already taken");
    else {
        NSLog(@"Your password has been set!");
        [blackList addObject:password];
    }

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        checkPassword(@"fg$g3!khp");
        
    
    }
    return 0;
}
