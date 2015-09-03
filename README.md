SRHotKeyManager
===============

The Module for Hot Key Management.

## SRHotKey

<pre>
let keyCode = SRKeyMap.virtualMap.keyCode(" ") // Space
let hotKey = SRHotKey(keyCode: keyCode, command: true, control: true, option: true, shift: false)
</pre>

## SRGlobalHotKeyManager

<pre>
func init() {
    SRGlobalHotKeyManager.sharedManager.register(hotKey, delegate: self)
}

func detectGlobalHotKeyPressing(hotKey: SRHotKey) {
    println("Global Hot Key Pressed: \(hotKey)")
}
</pre>

## SRHotKeyManager

TODO: No Implementations in currently. ;-)

# NOTE

This framework not tested yet ;-p
