//
//  SRGlobalHotKeyManager.swift
//  SRHotKeyManager
//
//  Created by Heeseung Seo on 2016. 9. 19..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa
import SRHotKeyManagerPrivates

public class SRGlobalHotKeyManager {
  
  public static let shared = SRGlobalHotKeyManager()
  
  private let impl = SRGlobalHotKeyManagerImpl.sharedManager()
  private var keyEventHandler: (() -> ())?
  
  public func start(keyEvent: SRKeyEvent, handler: @escaping () -> ()) {
    self.impl!.register(withKeyCode: keyEvent.event.keyCode, modifiers: ModifiersFromKeys(keyEvent.pressingCommand, keyEvent.pressingControl, keyEvent.pressingOption, keyEvent.pressingShift)) {
      handler()
    }
  }
  
  public func stop() {
    self.impl!.unregisterHotKey()
  }
  
}
