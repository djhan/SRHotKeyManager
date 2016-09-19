//
//  SRKeyEvent.swift
//  SRHotKeyManager
//
//  Created by Heeseung Seo on 2016. 9. 13..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

private let SRKeyEventLeftArrowKeyCode = SRKeyMap.shared.keyCode(string: "leftarrow")
private let SRKeyEventRightArrowKeyCode = SRKeyMap.shared.keyCode(string: "rightarrow")
private let SRKeyEventUpArrowKeyCode = SRKeyMap.shared.keyCode(string: "uparrow")
private let SRKeyEventDownArrowKeyCode = SRKeyMap.shared.keyCode(string: "downarrow")

public struct SRKeyEvent {
  
  public let event: NSEvent
  
  public init(event: NSEvent) {
    self.event = event
  }
  
  public init(keyString: String, command: Bool=false, control: Bool=false, option: Bool=false, shift: Bool=false) {
    var flags = NSEventModifierFlags()
    if command { flags.insert(.command) }
    if control { flags.insert(.control) }
    if option { flags.insert(.option) }
    if shift { flags.insert(.shift) }
    
    let keyCode = SRKeyMap.shared.keyCode(string: keyString)!
    
    self.event = NSEvent.keyEvent(with: NSKeyDown, location: NSPoint(), modifierFlags: flags, timestamp: 0, windowNumber: 0, context: nil, characters: "", charactersIgnoringModifiers: "", isARepeat: false, keyCode: keyCode)!
  }
  
  public var pressingCommand: Bool {
    return event.modifierFlags.contains([.command])
  }
  
  public var pressingControl: Bool {
    return event.modifierFlags.contains([.control])
  }
  
  public var pressingOption: Bool {
    return event.modifierFlags.contains([.option])
  }
  
  public var pressingShift: Bool {
    return event.modifierFlags.contains([.shift])
  }
  
  public var pressingLeftArrow: Bool {
    return event.keyCode == SRKeyEventLeftArrowKeyCode
  }
  
  public var pressingRightArrow: Bool {
    return event.keyCode == SRKeyEventRightArrowKeyCode
  }
  
  public var pressingUpArrow: Bool {
    return event.keyCode == SRKeyEventUpArrowKeyCode
  }
  
  public var pressingDownArrow: Bool {
    return event.keyCode == SRKeyEventDownArrowKeyCode
  }
  
  public var pressingDelete: Bool {
    return event.keyCode == SRKeyMap.shared.keyCode(string: "delete")
  }
  
  public func pressing(keyString: String) -> Bool {
    return event.keyCode == SRKeyMap.shared.keyCode(string: keyString.lowercased())
  }
  
}
