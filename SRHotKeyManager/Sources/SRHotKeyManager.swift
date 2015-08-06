//
//  SRHotKeyManager.swift
//  SRHotKeyManager
//  Implementaion Swift Wrapper
//
//  Created by Seorenn on 2015. 8. 3..
//  Copyright © 2015 Seorenn. All rights reserved.
//

import Cocoa
import SRHotKeyManagerPrivates

public class SRHotKey: CustomStringConvertible {
    private let impl: SRHotKeyImpl
    
    private init(impl: SRHotKeyImpl) {
        self.impl = impl
    }
    
    public var command: Bool { return self.impl.command }
    public var control: Bool { return self.impl.control }
    public var option: Bool { return self.impl.option }
    public var shift: Bool { return self.impl.shift }
    public var keyCode: UInt32 { return self.impl.keyCode }
    
    public init(keyCode: UInt32, command: Bool, control: Bool, option: Bool, shift: Bool) {
        self.impl = SRHotKeyImpl(keyCode: keyCode, command: command, control: control, option: option, shift: shift)
    }
    
    public var description: String {
        var result = "<SRHotKey"
        
        if self.command { result = result + " [CMD]" }
        if self.control { result = result + " [CTRL]" }
        if self.option { result = result + " [OPT]" }
        if self.shift { result = result + " [SHT]" }
        
        result = result + " [\(self.keyCode)]>"
        
        return result
    }
}

public class SRHotKeyManager {
    public static let sharedManager: SRHotKeyManager = SRHotKeyManager()
}

public protocol SRGlobalHotKeyManagerDelegate {
    func detectGlobalHotKeyPressing(hotKey: SRHotKey)
}

public class SRGlobalHotKeyManager: SRGlobalHotKeyManagerImplDelegate {
    public static let sharedManager: SRGlobalHotKeyManager = SRGlobalHotKeyManager()
    private var delegate: SRGlobalHotKeyManagerDelegate?
    private var hotKey: SRHotKey?
    private let impl = SRGlobalHotKeyManagerImpl.sharedManager()
    
    public func register(hotKey: SRHotKey, delegate: SRGlobalHotKeyManagerDelegate) {
        self.hotKey = hotKey
        self.impl.registerWithHotKey(hotKey.impl, delegate: self)
    }
    
    @objc public func globalHotKeyManagerImpl(impl: SRGlobalHotKeyManagerImpl!, detectPressingHotKey hotKeyImpl: SRHotKeyImpl!) {
        if let delegate = self.delegate {
            delegate.detectGlobalHotKeyPressing(self.hotKey!)
        }
    }
}

