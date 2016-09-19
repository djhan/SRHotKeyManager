//
//  SRLocalHotKeyManager.swift
//  SRHotKeyManager
//
//  Created by Heeseung Seo on 2016. 9. 19..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

public typealias SRLocalHotKeyClosure = (SRKeyEvent) -> Void

struct SRLocalHotKeyContext {
  let instance: AnyObject
  let closure: SRLocalHotKeyClosure
}

public class SRLocalHotKeyManager {
  
  public static let shared = SRLocalHotKeyManager()
  public var notifyLastInstanceOnly: Bool = true

  private var monitor: Any?
  private var contexts = [SRLocalHotKeyContext]()

  public func addKeyEventHandler(instance: AnyObject, closure: @escaping SRLocalHotKeyClosure) {
    //check instance duplication
    for (index, context) in self.contexts.enumerated() {
      if context.instance === instance {
        self.contexts.remove(at: index)
      }
    }
    
    self.contexts.append(SRLocalHotKeyContext(instance: instance, closure: closure))
  }
  
  public func start() {
    self.monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
      (event) -> NSEvent? in
      
      self.handleKeyboard(event: event)
      return event
    }
  }
  
  public func stop() {
    guard let monitor = self.monitor else { return }
    NSEvent.removeMonitor(monitor)
    self.monitor = nil
  }

  private func handleKeyboard(event: NSEvent) {
    let keyEvent = SRKeyEvent(event: event)
    
    if self.notifyLastInstanceOnly {
      self.notifyToLastInstance(keyEvent: keyEvent)
    } else {
      self.notify(keyEvent: keyEvent)
    }
  }
  
  private func notifyToLastInstance(keyEvent: SRKeyEvent) {
    guard let context = self.contexts.last else { return }
    context.closure(keyEvent)
  }
  
  private func notify(keyEvent: SRKeyEvent) {
    for context in self.contexts {
      context.closure(keyEvent)
    }
  }
}
