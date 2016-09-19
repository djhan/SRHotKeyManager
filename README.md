SRHotKeyManager
===============

The Frameworks for Handling Key Event and Hot Key Management.

## SRKeyEvent

Simple structure to support key event more easily.

```Swift
let keyEvent = SRKeyEvent(keyString: "A")
let anotherKey = SRKeyEvent(keyString: "O", command: true, control: false, option: false, shift: false)
```

## SRKeyMap

SRKeyMap provides Key mapping informations.

```Swift
let code = SRKeyMap.shared.keyCode(string: "A")
let string = SRKeyMap.shared.string(keyCode: someNSEvent.keyCode)!
```

## SRLocalHotKeyManager

Handle keyboard input from your app more easily.

```Swift
SRLocalHotKeyManager.shared.addKeyEventHandler(instance: self) {
  (keyEvent) in
  print("some key event occured \(keyEvent)
}
SRLocalHotKeyManager.notifyLastInstanceOnly = true
SRLocalHotKeyManager.shared.start()
```

## SRGlobalHotKeyManager

Support global hotkey. eg. if your app was not focused, but your app notify single hot key.

```Swift
let keyEvent = SRKeyEvent(keyString: "A", command: true)
SRGlobalHotKeyManager.shared.start(keyEvent: keyEvent) {
  print("global hot key pressed")
}
```

## NOTE

This framework not fully tested yet ;-)
