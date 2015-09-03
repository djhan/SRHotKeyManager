SRHotKeyManager
===============

The Module for Hot Key Management.

## SRHotKey

```Swift
// Generate Hot Key Instance: Command-Control-Option-Space
if let keyCode = SRKeyMap.virtualMap.keyCode(" ") {
    let hotKey = SRHotKey(keyCode: keyCode, command: true, control: true, option: true, shift: false)
    ...
}
```

## SRGlobalHotKeyManager

```Swift
func init() {
    ...
    SRGlobalHotKeyManager.sharedManager.register(hotKey, delegate: self)
}

...

func detectGlobalHotKeyPressing(hotKey: SRHotKey) {
    println("Global Hot Key Pressed: \(hotKey)")
}
```

## SRHotKeyManager

TODO: No Implementations in currently. ;-)

# NOTE

This framework not tested yet ;-p
