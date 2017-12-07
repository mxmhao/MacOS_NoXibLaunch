//
//  main.m
//  NoXibLaunch
//
//  Created by noontec on 2017/12/4.
//  Copyright © 2017年 noontec. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    [NSApplication sharedApplication].delegate = [AppDelegate new];
    return NSApplicationMain(argc, argv);
}
