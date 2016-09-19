SRHotKeyManager
===============

The frameworks to handling keyboard events and managing hotkey. This framework requies Swift 3 and Xcode 8.

## SRKeyEvent

SRKeyEvent is simple structure to describe key event more easily.

```Swift
let keyEvent = SRKeyEvent(keyString: "A")
if keyEvent.pressingCommand { print("pressing Command-A") }

let eventFromNSEvent = SRKeyEvent(event: someNSEvent)
let anotherKey = SRKeyEvent(keyString: "O", command: true, control: false, option: false, shift: false)
```

## SRKeyMap

SRKeyMap provides key map informations.

```Swift
let code = SRKeyMap.shared.keyCode(string: "A")
let string = SRKeyMap.shared.string(keyCode: someNSEvent.keyCode)!
```

## SRLocalHotKeyManager

SRLocalHotKeyManager is support to handle keyboard input from your app more easily.

```Swift
SRLocalHotKeyManager.shared.addKeyEventHandler(instance: self) {
  (keyEvent) in
  print("some key event occured \(keyEvent)")
}
SRLocalHotKeyManager.notifyLastInstanceOnly = true
SRLocalHotKeyManager.shared.start()
```

## SRGlobalHotKeyManager

If your app requires hot key to trigger when app not focusing, use this.

```Swift
let keyEvent = SRKeyEvent(keyString: "A", command: true)
SRGlobalHotKeyManager.shared.start(keyEvent: keyEvent) {
  print("global hot key pressed")
}
```

## NOTE

This framework not fully tested yet ;-)
