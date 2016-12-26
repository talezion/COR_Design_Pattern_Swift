# Chain of Responsibility in Swift

[![Swift Version](https://img.shields.io/badge/Swift-3.0.x-orange.svg)]()

##Example

To run the project, simply clone the repo.

###Installation

1. Add start using COR in your prject, copy the following files:

```
ChainProtocols.swift
HandlerType.swift
```

###Usage

1. Create a new `ChainHandler` class and conform to `ChainHandlerProtocol`

```swift
class ExampleChainHandler: ChainHandlerProtocol {

    var currentHandler: HandlerProtocol?

    init(){
        //Add handler objects
    }
}

```

Now that we have a chain, responsible for executing how handler objects, we can go ahead and create an istance of `HandlerObject`, but first, we want to start adding handler types

2. Add a handler type in `HandlerType`.

In your `HandlerType.swift` file, add a new type

```swift
enum HandlerType {
    case `default`
    case myFirstHandler
}

```

Once we set a hadnler type, we can go ahead and create a `HandlerObject`.

2. Creat an instance of `HandlerObject`

```swift
//MARK: - Handler:
///Add Handler and conform to HandlerProtocol
class HandlerObjectOne: HandlerProtocol {

    var nextHandler: HandlerProtocol?

    /// Where the magic happens
    func handel(_ object: HandlerObjectProtocol) {

        ///Check if the current type equals to currentHandler
        if HandlerType.myFirstHandler == object.type {

            /// MARK: Add logic here
            print("My First Handler")

        } else {

            ///Execute the next handler in the chain
            ///IMPORTANT NOTE: In case the current handler is the last in the chain, force a crash to make sure you handle all types:

            if nextHandler != nil {
                self.nextHandler?.handel(object)
            } else {
                fatalError("No handler takes care of me! Make sure to add me to the chain...")
            }
        }
    }
}
```

As you can see, we force a crash in case the handler was not added to the chain. Let's add it to the chain.

3. Add a handler to the chain.

In the `ChainHandler` `init`, set the handlers.

```swift
/// Set Handlers
currentHandler = HandlerObjectOne() // Your handler object
```
Here is the fun part, you can add as many hadnlers as you want:

```swift
class ExampleChainHandler: ChainHandlerProtocol {

    var currentHandler: HandlerProtocol?

    init(){
        /// Set Handlers
        currentHandler = HandlerObjectOne() // Your handler object
        let handler2 = HandlerObjectTwo()

        //MARK: All you have to do is make sure the predecessor, sets a successor handler for the chain to continue.
        // Configureing successor
        currentHandler?.set(handler2)
    }
}
```
Now that everything is set, we can handle an object.

4. Handel

```Swift
let handler = HandlerObject(type: .one, target: self)

let cor = ChainHandler()
cor.handel(handler)
```

You can set different types of `HandlerObjects`

```swift
let handler = HandlerObject(type: <#T##HandlerType#>, target: <#T##Any#>)
let handler = HandlerObject(type: <#T##HandlerType#>, target: <#T##Any#>, userInfo: <#T##[AnyHashable : Any]?#>)
let handler = HandlerObject(type: <#T##HandlerType#>, target: <#T##Any#>, block: <#T##CORComplitionBlock##CORComplitionBlock##([AnyHashable : Any]?) -> Void#>, failureBlock: <#T##CORFailureBlock?##CORFailureBlock?##(ChainError?) -> Void#>)
let handler = HandlerObject(type: <#T##HandlerType#>, target: <#T##Any#>, userInfo: <#T##[AnyHashable : Any]?#>, block: <#T##CORComplitionBlock##CORComplitionBlock##([AnyHashable : Any]?) -> Void#>, failureBlock: <#T##CORFailureBlock?##CORFailureBlock?##(ChainError?) -> Void#>)
```

You can pass `userInfo` or a `complitionBlock` && || `failureBlock`

Feel free to fork and suggest changes.


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).




















