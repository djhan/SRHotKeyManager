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
  
  @IBOutlet weak var label: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.label.stringValue = "Press Any Key"
    
    // Do any additional setup after loading the view.
    let keyEvent = SRKeyEvent(keyString: "O", command: true, control: true, option: true, shift: false)

    SRGlobalHotKeyManager.shared.start(keyEvent: keyEvent) {
      self.label.stringValue = "Global Key Event \(keyEvent)"
    }
    
    SRLocalHotKeyManager.shared.addKeyEventHandler(instance: self) { (keyEvent) in
      self.label.stringValue = "\(keyEvent)"
    }
    SRLocalHotKeyManager.shared.start()
  }
  
}

