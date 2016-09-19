//
//  SRKeyMap.swift
//  Dazy
//
//  Created by Heeseung Seo on 2016. 9. 13..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

public class SRKeyMap {
  
  public static let shared = SRKeyMap()
  private var code2string = [String](repeating: "", count: 128)
  private var string2code = [String: UInt16]()
  
  public init() {
    generateVirtualKeyCodeMap()
  }
  
  private func generateVirtualKeyCodeMap() {
    string2code["a"] = 0x00
    string2code["s"] = 0x01
    string2code["d"] = 0x02
    string2code["f"] = 0x03
    string2code["h"] = 0x04
    string2code["g"] = 0x05
    string2code["z"] = 0x06
    string2code["x"] = 0x07
    string2code["c"] = 0x08
    string2code["v"] = 0x09
    string2code["b"] = 0x0B
    string2code["q"] = 0x0C
    string2code["w"] = 0x0D
    string2code["e"] = 0x0E
    string2code["r"] = 0x0F
    string2code["y"] = 0x10
    string2code["t"] = 0x11
    string2code["1"] = 0x12
    string2code["2"] = 0x13
    string2code["3"] = 0x14
    string2code["4"] = 0x15
    string2code["6"] = 0x16
    string2code["5"] = 0x17
    string2code["="] = 0x18    // Equal
    string2code["9"] = 0x19
    string2code["7"] = 0x1A
    string2code["-"] = 0x1B    // Minus
    string2code["8"] = 0x1C
    string2code["0"] = 0x1D
    string2code[")"] = 0x1E    // Right Bracket
    string2code["o"] = 0x1F    // Oh, not zero ;-)
    string2code["u"] = 0x20
    string2code["("] = 0x21    // Left Bracket
    string2code["i"] = 0x22
    string2code["p"] = 0x23
    string2code["l"] = 0x25
    string2code["j"] = 0x26
    string2code["'"] = 0x27    // Quote
    string2code["k"] = 0x28
    string2code[";"] = 0x29    // Semicolon
    string2code["\\"] = 0x2A   // Backslash
    string2code[","] = 0x2B    // Comma
    string2code["/"] = 0x2C    // Slash
    string2code["n"] = 0x2D
    string2code["m"] = 0x2E
    string2code["."] = 0x2F    // Period
    // TODO: What is Grave? Tilt?
    //kVK_ANSI_Grave                = 0x32
    // TODO: I have no keypad
    //kVK_ANSI_KeypadDecimal        = 0x41,
    //kVK_ANSI_KeypadMultiply       = 0x43,
    //kVK_ANSI_KeypadPlus           = 0x45,
    //kVK_ANSI_KeypadClear          = 0x47,
    //kVK_ANSI_KeypadDivide         = 0x4B,
    //kVK_ANSI_KeypadEnter          = 0x4C,
    //kVK_ANSI_KeypadMinus          = 0x4E,
    //kVK_ANSI_KeypadEquals         = 0x51,
    //kVK_ANSI_Keypad0              = 0x52,
    //kVK_ANSI_Keypad1              = 0x53,
    //kVK_ANSI_Keypad2              = 0x54,
    //kVK_ANSI_Keypad3              = 0x55,
    //kVK_ANSI_Keypad4              = 0x56,
    //kVK_ANSI_Keypad5              = 0x57,
    //kVK_ANSI_Keypad6              = 0x58,
    //kVK_ANSI_Keypad7              = 0x59,
    //kVK_ANSI_Keypad8              = 0x5B,
    //kVK_ANSI_Keypad9              = 0x5C
    
    string2code["return"] = 0x24
    string2code["tab"] = 0x30
    string2code[" "] = 0x31    // Space
    string2code["delete"] = 0x33
    string2code["escape"] = 0x35
    string2code["command"] = 0x37
    string2code["shift"] = 0x38
    string2code["capslock"] = 0x39
    string2code["option"] = 0x3A
    string2code["control"] = 0x3B
    string2code["rightshift"] = 0x3C
    string2code["rightoption"] = 0x3D
    string2code["rightcontrol"] = 0x3E
    string2code["function"] = 0x3F
    string2code["f17"] = 0x40
    string2code["volumeup"] = 0x48
    string2code["volumedown"] = 0x49
    string2code["mute"] = 0x4A
    string2code["f18"] = 0x4F
    string2code["f19"] = 0x50
    string2code["f20"] = 0x5A
    string2code["f5"] = 0x60
    string2code["f6"] = 0x61
    string2code["f7"] = 0x62
    string2code["f3"] = 0x63
    string2code["f8"] = 0x64
    string2code["f9"] = 0x65
    string2code["f11"] = 0x67
    string2code["f13"] = 0x69
    string2code["f16"] = 0x6A
    string2code["f14"] = 0x6B
    string2code["f10"] = 0x6D
    string2code["f12"] = 0x6F
    string2code["f15"] = 0x71
    string2code["help"] = 0x72
    string2code["home"] = 0x73
    string2code["pageup"] = 0x74
    string2code["forwarddelete"] = 0x75
    string2code["f4"] = 0x76
    string2code["end"] = 0x77
    string2code["f2"] = 0x78
    string2code["pagedown"] = 0x79
    string2code["f1"] = 0x7A
    string2code["leftarrow"] = 0x7B
    string2code["rightarrow"] = 0x7C
    string2code["downarrow"] = 0x7D
    string2code["uparrow"] = 0x7E
    
    // TODO: What is this?
    //kVK_ISO_Section               = 0x0A
    
    // TODO: JIS keyboards only
    //kVK_JIS_Yen                   = 0x5D,
    //kVK_JIS_Underscore            = 0x5E,
    //kVK_JIS_KeypadComma           = 0x5F,
    //kVK_JIS_Eisu                  = 0x66,
    //kVK_JIS_Kana                  = 0x68
    
    for key in string2code.keys {
      let index = Int(string2code[key]!)
      code2string[index] = key
    }
  }
  
  public func keyCode(string: String) -> UInt16? {
    return string2code[string.lowercased()]
  }
  
  public func string(keyCode: UInt16) -> String? {
    return code2string[Int(keyCode)]
  }
  
}
