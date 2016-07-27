# COS-Design-Pattern Swift

###Installation

1. Add `ChainHandler.swift` to your project

###Usage

1. Create a new `HandlerObject`

```Swift
let newObject = HandlerObject(type: .ObjectType)
```

2. Creat an instance of `ChainHandler`

```Swift
let cor = ChainHandler()
```

3. Handel

```Swift
cor.handel(newObject)
```