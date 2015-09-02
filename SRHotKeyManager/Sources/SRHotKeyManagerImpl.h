//
//  SRHotKeyManagerImpl.h
//  SRHotKeyManager
//
//  Created by Seorenn on 2014. 11. 10..
//  Copyright (c) 2014 Seorenn. All rights reserved.
//

#import "TargetConditionals.h"

#if !TARGET_OS_IPHONE

#import <Foundation/Foundation.h>

@class SRHotKeyImpl;
typedef void (^SRGlobalHotKeyImplHandler)();

/* The Key Code (from HITookbox/Events.h)
 ANSI Characters = kVK_ANSI_?
 eg. 'A' is kVK_ANSI_A
 
 Another Key Codes = kVK_?????
 eg. RETURN in kVK_Return
 */
@interface SRHotKeyImpl: NSObject
@property (nonatomic, assign) BOOL command;
@property (nonatomic, assign) BOOL control;
@property (nonatomic, assign) BOOL option;
@property (nonatomic, assign) BOOL shift;
@property (nonatomic, assign) UInt16 keyCode;
- (id)initWithKeyCode:(UInt16)keyCode command:(BOOL)command control:(BOOL)control option:(BOOL)option shift:(BOOL)shift;
@end

@class SRGlobalHotKeyManagerImpl;
@protocol SRGlobalHotKeyManagerImplDelegate

- (void)globalHotKeyManagerImpl:(SRGlobalHotKeyManagerImpl *)impl detectPressingHotKey:(SRHotKeyImpl *)hotKeyImpl;

@end



@interface SRGlobalHotKeyManagerImpl: NSObject
+ (SRGlobalHotKeyManagerImpl *)sharedManager;
- (void)registerWithHotKey:(SRHotKeyImpl *)hotKey handler:(SRGlobalHotKeyImplHandler)handler;
- (void)registerWithHotKey:(SRHotKeyImpl *)hotKey delegate:(id<SRGlobalHotKeyManagerImplDelegate>)delegate;
@end

@interface SRHotKeyManagerImpl : NSObject
// TODO
@end

#endif