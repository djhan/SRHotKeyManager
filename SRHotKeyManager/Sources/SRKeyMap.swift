//
//  SRKeyMap.swift
//  SRHotKeyManager
//
//  Created by Heeseung Seo on 2015. 9. 3..
//  Copyright © 2015년 Seorenn. All rights reserved.
//

import Cocoa

public class SRKeyMap {
    public static let virtualMap = SRKeyMap()
    
    private var code2string = [String](count: 128, repeatedValue: "")
    private var string2code = [String: UInt16]()
    
    public init() {
        self.generateVirtualKeyCodeMap()
    }
    
    private func generateVirtualKeyCodeMap() {
        self.string2code["a"] = 0x00
        self.string2code["s"] = 0x01
        self.string2code["d"] = 0x02
        self.string2code["f"] = 0x03
        self.string2code["h"] = 0x04
        self.string2code["g"] = 0x05
        self.string2code["z"] = 0x06
        self.string2code["x"] = 0x07
        self.string2code["c"] = 0x08
        self.string2code["v"] = 0x09
        self.string2code["b"] = 0x0B
        self.string2code["q"] = 0x0C
        self.string2code["w"] = 0x0D
        self.string2code["e"] = 0x0E
        self.string2code["r"] = 0x0F
        self.string2code["y"] = 0x10
        self.string2code["t"] = 0x11
        self.string2code["1"] = 0x12
        self.string2code["2"] = 0x13
        self.string2code["3"] = 0x14
        self.string2code["4"] = 0x15
        self.string2code["6"] = 0x16
        self.string2code["5"] = 0x17
        self.string2code["="] = 0x18    // Equal
        self.string2code["9"] = 0x19
        self.string2code["7"] = 0x1A
        self.string2code["-"] = 0x1B    // Minus
        self.string2code["8"] = 0x1C
        self.string2code["0"] = 0x1D
        self.string2code[")"] = 0x1E    // Right Bracket
        self.string2code["o"] = 0x1F    // Oh, not zero ;-)
        self.string2code["u"] = 0x20
        self.string2code[")"] = 0x21    // Left Bracket
        self.string2code["i"] = 0x22
        self.string2code["p"] = 0x23
        self.string2code["l"] = 0x25
        self.string2code["j"] = 0x26
        self.string2code["'"] = 0x27    // Quote
        self.string2code["k"] = 0x28
        self.string2code[";"] = 0x29    // Semicolon
        self.string2code["\\"] = 0x2A   // Backslash
        self.string2code[","] = 0x2B    // Comma
        self.string2code["/"] = 0x2C    // Slash
        self.string2code["n"] = 0x2D
        self.string2code["m"] = 0x2E
        self.string2code["."] = 0x2F    // Period
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

        self.string2code["return"] = 0x24
        self.string2code["tab"] = 0x30
        self.string2code[" "] = 0x31    // Space
        self.string2code["delete"] = 0x33
        self.string2code["escape"] = 0x35
        self.string2code["command"] = 0x37
        self.string2code["shift"] = 0x38
        self.string2code["capslock"] = 0x39
        self.string2code["option"] = 0x3A
        self.string2code["control"] = 0x3B
        self.string2code["rightshift"] = 0x3C
        self.string2code["rightoption"] = 0x3D
        self.string2code["rightcontrol"] = 0x3E
        self.string2code["function"] = 0x3F
        self.string2code["f17"] = 0x40
        self.string2code["volumeup"] = 0x48
        self.string2code["volumedown"] = 0x49
        self.string2code["mute"] = 0x4A
        self.string2code["f18"] = 0x4F
        self.string2code["f19"] = 0x50
        self.string2code["f20"] = 0x5A
        self.string2code["f5"] = 0x60
        self.string2code["f6"] = 0x61
        self.string2code["f7"] = 0x62
        self.string2code["f3"] = 0x63
        self.string2code["f8"] = 0x64
        self.string2code["f9"] = 0x65
        self.string2code["f11"] = 0x67
        self.string2code["f13"] = 0x69
        self.string2code["f16"] = 0x6A
        self.string2code["f14"] = 0x6B
        self.string2code["f10"] = 0x6D
        self.string2code["f12"] = 0x6F
        self.string2code["f15"] = 0x71
        self.string2code["help"] = 0x72
        self.string2code["home"] = 0x73
        self.string2code["pageup"] = 0x74
        self.string2code["forwarddelete"] = 0x75
        self.string2code["f4"] = 0x76
        self.string2code["end"] = 0x77
        self.string2code["f2"] = 0x78
        self.string2code["pagedown"] = 0x79
        self.string2code["f1"] = 0x7A
        self.string2code["leftarrow"] = 0x7B
        self.string2code["rightarrow"] = 0x7C
        self.string2code["downarrow"] = 0x7D
        self.string2code["uparrow"] = 0x7E

        // TODO: What is this?
        //kVK_ISO_Section               = 0x0A
        
        // TODO: JIS keyboards only
        //kVK_JIS_Yen                   = 0x5D,
        //kVK_JIS_Underscore            = 0x5E,
        //kVK_JIS_KeypadComma           = 0x5F,
        //kVK_JIS_Eisu                  = 0x66,
        //kVK_JIS_Kana                  = 0x68
        
        for key in self.string2code.keys {
            let index = Int(self.string2code[key]!)
            self.code2string[index] = key
        }
    }
    
    public func keyCode(string: String) -> UInt16? {
        return self.string2code[string.lowercaseString]
    }
    
    public func string(keyCode: UInt16) -> String? {
        return self.code2string[Int(keyCode)]
    }
}
