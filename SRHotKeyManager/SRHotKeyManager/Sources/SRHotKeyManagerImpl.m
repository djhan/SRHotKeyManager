//
//  SRHotKeyManagerImpl.m
//  SRHotKeyManager Objective-C Implementaions
//
//  Created by Heeseung Seo on 2014. 11. 10..
//  Copyright (c) 2014 Seorenn. All rights reserved.
//

#import "SRHotKeyManagerImpl.h"

#if TARGET_OS_IPHONE
#warning SRHotKeyManager was disabled because target platform is iOS.
#else

#import <Carbon/Carbon.h>

#define BOOLSTR(bv) ((bv) ? @"true":@"false")
#define SRHotKeyConvertorDefaultStringLength    4

UInt16 ModifiersFromKeys(BOOL command, BOOL control, BOOL option, BOOL shift) {
  UInt16 result = 0;
  
  if (command) result += cmdKey;
  if (control) result += controlKey;
  if (option) result += optionKey;
  if (shift) result += shiftKey;
  
  return result;
}

#pragma mark - SRGlobalHotKeyManager Implementation Class

@interface SRGlobalHotKeyManagerImpl ()

@property (nonatomic, strong) SRGlobalHotKeyImplHandler handler;

@end

OSStatus SRGlobalHotKeyManagerImplHandler(EventHandlerCallRef nextHandler, EventRef theEvent, void *userData) {
  SRGlobalHotKeyManagerImpl *manager = (__bridge SRGlobalHotKeyManagerImpl *)userData;
  
  if (manager.handler) {
    manager.handler();
  }
  
  return noErr;
}

EventHotKeyRef g_hotKeyRef;

@implementation SRGlobalHotKeyManagerImpl

+ (SRGlobalHotKeyManagerImpl *)sharedManager {
  static SRGlobalHotKeyManagerImpl *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[SRGlobalHotKeyManagerImpl alloc] init];
  });
  return instance;
}

- (id)init {
  self = [super init];
  if (self) {
    EventTypeSpec eventType;
    eventType.eventClass = kEventClassKeyboard;
    eventType.eventKind = kEventHotKeyPressed;
    
    InstallApplicationEventHandler(&SRGlobalHotKeyManagerImplHandler, 1, &eventType, (__bridge void *)self, NULL);
  }
  return self;
}

- (void)registerWithKeyCode:(UInt16)keyCode modifiers:(UInt16)modifiers handler:(SRGlobalHotKeyImplHandler)handler {
  self.handler = handler;
  
  EventHotKeyID hotKeyID;
  hotKeyID.signature = 'srgh';
  hotKeyID.id = 0;
  
  RegisterEventHotKey(keyCode, modifiers, hotKeyID, GetApplicationEventTarget(), 0, &g_hotKeyRef);
}

- (void)unregisterHotKey {
  UnregisterEventHotKey(g_hotKeyRef);
  self.handler = nil;
}

@end

#endif
