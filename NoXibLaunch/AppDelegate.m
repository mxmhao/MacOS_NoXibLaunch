//
//  AppDelegate.m
//  NoXibLaunch
//
//  Created by noontec on 2017/12/4.
//  Copyright © 2017年 noontec. All rights reserved.
//

#warning main.m文件中有自定义修改,自定义后工程里的window.xib文件不能选中"visible to launch"，不然会自动启动

#import "AppDelegate.h"

@interface AppDelegate () <NSWindowDelegate>
@property (nonatomic, strong) NSWindow *window;
@property (nonatomic, assign) int myAge;
@end

@implementation AppDelegate

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
//    [self initMainMenu];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self initMainMenu];
    self.myAge = 1;
    //自定义后工程里不能有window.xib文件了，不然会被当做默认window启动
    //崩溃解决方法一：必须持有第一个Window的引用，不然关闭App时会崩溃
    _window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 100, 600, 600) styleMask:NSTitledWindowMask | NSClosableWindowMask |NSMiniaturizableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:YES];
//    _window.delegate = self;//崩溃解决方法二
    [_window makeKeyAndOrderFront:nil];
}

//NSWindow的代理方法
- (void)windowWillClose:(NSNotification *)notification
{
    //崩溃解决方法二：上面设置代理
//    NSWindow *window = notification.object;
//    [NSApp terminate:window];//这个是必须的，不然app会崩溃
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
//    _window = nil;//这个不能有，会崩溃的
}

//自定义菜单
- (void)initMainMenu
{
    //这个标题会被忽略
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Main Menu"];
    // NSMenu.menuBarVisible = YES;
    //这个标题会被忽略
    NSMenuItem * appItem = [[NSMenuItem alloc] initWithTitle:@"App Item" action:Nil keyEquivalent:@""];
    [menu addItem:appItem];
    //这个标题会被忽略
    NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"application"];
    NSMenuItem *aboutItem  = [[NSMenuItem alloc] initWithTitle:@"about" action:Nil keyEquivalent:@""];
    [appMenu addItem:aboutItem];
    [appMenu addItem:[NSMenuItem separatorItem]];
    NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"quit" action:Nil keyEquivalent:@""];
    [appMenu addItem:quitItem];
    [menu setSubmenu:appMenu forItem:appItem];
    
    //这个标题会被忽略
    NSMenuItem *windowItem = [[NSMenuItem alloc] initWithTitle:@"Window Item" action:Nil keyEquivalent:@""];
    [menu addItem:windowItem];
    NSMenu *windowMenu = [[NSMenu alloc] initWithTitle:@"window"];
    [windowMenu addItemWithTitle:@"hide me" action:Nil keyEquivalent:@""];
    [windowMenu addItemWithTitle:@"hide others" action:Nil keyEquivalent:@""];
    [menu setSubmenu:windowMenu forItem:windowItem];
    NSApp.mainMenu = menu;
}

@end

@interface AppDelegate (Test)
@property (nonatomic, strong) NSObject *myNewObj;
@property (nonatomic, assign) int myNewMoney;
@end

@implementation AppDelegate (Test)

- (NSObject *)myNewObj
{
//    OBJC_ASSOCIATION_ASSIGN
    return nil;
}

- (void)setMyNewObj:(NSObject *)myNewObj
{
}

- (int)myNewMoney
{
    return 1;
}

- (void)setMyNewMoney:(int)myNewMoney
{
    
}

@end
