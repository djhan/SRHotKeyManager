//
//  ViewController.swift
//  SRHotKeyManagerDemo
//
//  Created by Heeseung Seo on 2015. 9. 2..
//  Copyright © 2015년 Seorenn. All rights reserved.
//

import Cocoa
import SRHotKeyManager

class ViewController: NSViewController, SRGlobalHotKeyManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hotkey = SRHotKey(keyString: "O", command: true, control: true, option: true, shift: false)
        SRGlobalHotKeyManager.sharedManager.register(hotkey, delegate: self)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func detectGlobalHotKeyPressing(hotKey: SRHotKey) {
        print("BEEP!")
    }
}

