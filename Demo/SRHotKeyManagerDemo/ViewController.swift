//
//  ViewController.swift
//  SRHotKeyManagerDemo
//
//  Created by Heeseung Seo on 2015. 9. 2..
//  Copyright © 2015년 Seorenn. All rights reserved.
//

import Cocoa
import SRHotKeyManager

class ViewController: NSViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let keyEvent = SRKeyEvent(keyString: "O", command: true, control: true, option: true, shift: false)

    SRGlobalHotKeyManager.shared.start(keyEvent: keyEvent) { 
      print("Global Hot Key Pressed: \(keyEvent)")
    }
  }
  
}

