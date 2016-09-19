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

typedef void (^SRGlobalHotKeyImplHandler)();

UInt16 ModifiersFromKeys(BOOL command, BOOL control, BOOL option, BOOL shift);

@interface SRGlobalHotKeyManagerImpl: NSObject

+ (SRGlobalHotKeyManagerImpl *)sharedManager;
- (void)registerWithKeyCode:(UInt16)keyCode modifiers:(UInt16)modifiers handler:(SRGlobalHotKeyImplHandler)handler;

@end

#endif
