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

#pragma mark - SRHotKey Class

@interface SRHotKeyImpl ()
@property (nonatomic, readonly) UInt32 modifiers;
@end

@implementation SRHotKeyImpl

- (id)initWithKeyCode:(UInt32)keyCode command:(BOOL)command control:(BOOL)control option:(BOOL)option shift:(BOOL)shift {
    self = [super init];
    if (self) {
        self.keyCode = keyCode;
        self.command = command;
        self.control = control;
        self.option = option;
        self.shift = shift;
    }
    return self;
}

- (UInt32)modifiers {
    UInt32 result = 0;
    
    if (self.command) result += cmdKey;
    if (self.control) result += controlKey;
    if (self.option) result += optionKey;
    if (self.shift) result += shiftKey;
    
    return result;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<SRHotKey Command[%@] Control[%@] Option[%@] Shift[%@] Code[%d]>", BOOLSTR(self.command), BOOLSTR(self.control), BOOLSTR(self.option), BOOLSTR(self.shift), self.keyCode];
}

@end

#pragma mark - SRGlobalHotKeyManagerImpl Class

@interface SRGlobalHotKeyManagerImpl ()
@property (nonatomic, strong) SRHotKeyImpl *hotKey;
@property (nonatomic, strong) SRGlobalHotKeyImplHandler handler;
@property (nonatomic, strong) id<SRGlobalHotKeyManagerImplDelegate> delegate;
@end

OSStatus SRGlobalHotKeyManagerImplHandler(EventHandlerCallRef nextHandler, EventRef theEvent, void *userData) {
    //SRGlobalHotKeyManagerImpl *manager = [SRGlobalHotKeyManagerImpl sharedManager];
    SRGlobalHotKeyManagerImpl *manager = (__bridge SRGlobalHotKeyManagerImpl *)userData;
    
    if (manager.delegate) {
        [manager.delegate globalHotKeyManagerImpl:manager detectPressingHotKey:manager.hotKey];
    }
    else if (manager.handler) {
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
        
        //#define InstallApplicationEventHandler( handler, numTypes, list, userData, outHandlerRef ) \

        InstallApplicationEventHandler(&SRGlobalHotKeyManagerImplHandler, 1, &eventType, (__bridge void *)self, NULL);
    }
    return self;
}

- (void)registerWithHotKey:(SRHotKeyImpl *)hotKey handler:(SRGlobalHotKeyImplHandler)handler {
    self.hotKey = hotKey;
    self.handler = handler;
    
    EventHotKeyID hotKeyID;
    hotKeyID.signature = 'srgh';
    hotKeyID.id = 0;
    
    RegisterEventHotKey(hotKey.keyCode, hotKey.modifiers, hotKeyID, GetApplicationEventTarget(), 0, &g_hotKeyRef);
}

- (void)registerWithHotKey:(SRHotKeyImpl *)hotKey delegate:(id<SRGlobalHotKeyManagerImplDelegate>)delegate {
    self.hotKey = hotKey;
    self.delegate = delegate;
    
    EventHotKeyID hotKeyID;
    hotKeyID.signature = 'srgh';
    hotKeyID.id = 0;
    
    RegisterEventHotKey(hotKey.keyCode, hotKey.modifiers, hotKeyID, GetApplicationEventTarget(), 0, &g_hotKeyRef);
}

- (void)unregisterHotKey {
    UnregisterEventHotKey(g_hotKeyRef);
    self.hotKey = nil;
    self.handler = nil;
}

@end

#pragma mark - SRHotKeyManagerImpl Class

@implementation SRHotKeyManagerImpl
// TODO
@end

#endif