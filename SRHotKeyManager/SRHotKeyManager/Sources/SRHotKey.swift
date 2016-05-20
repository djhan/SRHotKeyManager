//
//  SRHotKey.swift
//  SRHotKeyManager
//
//  Created by Heeseung Seo on 2016. 5. 20..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa
import SRHotKeyManagerPrivates

public struct SRHotKey: CustomDebugStringConvertible {
  internal let impl: SRHotKeyImpl
  
  private init(impl: SRHotKeyImpl) {
    self.impl = impl
  }
  
  public var command: Bool { return self.impl.command }
  public var control: Bool { return self.impl.control }
  public var option: Bool { return self.impl.option }
  public var shift: Bool { return self.impl.shift }
  public var keyCode: UInt16 { return self.impl.keyCode }
  public var characters: String?
  
  public init(keyCode: UInt16, command: Bool, control: Bool, option: Bool, shift: Bool) {
    self.characters = SRKeyMap.virtualMap.string(keyCode)
    self.impl = SRHotKeyImpl(keyCode: keyCode, command: command, control: control, option: option, shift: shift)
  }
  
  public init(keyString: String, command: Bool, control: Bool, option: Bool, shift: Bool) {
    let keyCode = SRKeyMap.virtualMap.keyCode(keyString)!
    self.init(keyCode: keyCode, command: command, control: control, option: option, shift: shift)
  }
  
  /**
   Initialize with NSEvent(eg. You can use this class from keyDown or keyUp handler)
   */
  public init(event: NSEvent) {
    self.init(keyCode: event.keyCode,
              command: event.modifierFlags.contains(.CommandKeyMask),
              control: event.modifierFlags.contains(.ControlKeyMask),
              option: event.modifierFlags.contains(.AlternateKeyMask),
              shift: event.modifierFlags.contains(.ShiftKeyMask))
  }
  
  public var debugDescription: String {
    var result = "<SRHotKey"
    
    if self.command { result = result + " [CMD]" }
    if self.control { result = result + " [CTRL]" }
    if self.option { result = result + " [OPT]" }
    if self.shift { result = result + " [SHT]" }
    
    if let c = self.characters {
      result = result + " '\(c)'"
    } else {
      result = result + " UNKNOWN"
    }
    
    result = result + "(\(self.keyCode))>"
    
    return result
  }
}
