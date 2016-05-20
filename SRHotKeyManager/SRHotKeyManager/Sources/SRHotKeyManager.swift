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
        self.delegate = delegate
        self.impl.registerWithHotKey(hotKey.impl, delegate: self)
    }
    
    @objc public func globalHotKeyManagerImpl(impl: SRGlobalHotKeyManagerImpl!, detectPressingHotKey hotKeyImpl: SRHotKeyImpl!) {
        if let delegate = self.delegate {
            delegate.detectGlobalHotKeyPressing(self.hotKey!)
        }
    }
}

