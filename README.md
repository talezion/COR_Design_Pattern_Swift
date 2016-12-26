# Chain of Responsibility in Swift

[![Swift Version](https://img.shields.io/badge/Swift-3.0.x-orange.svg)]()

##Example

To run the project, simply clone the repo.

###Installation

To start using COR in your prject, copy the following files:

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

Now that we have a chain, responsible for executing handler objects, we can go ahead `handler`, but first, we want to start adding handler types

    2. Add a handler type in HandlerType.

In your `HandlerType.swift` file, add a new type

```swift
enum HandlerType {
    case `default`
    case myFirstHandler
}

```

Once we set a hadnler type, we can go ahead and create a `Handler`.

    3. Creat a of Handler

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

    4. Add a handler to the chain.

In the `ChainHandler` `init`, set the handlers.

```swift
/// Set Handlers
currentHandler = HandlerObjectOne() // Your handler object
```
Here is the fun part, you can add as many handlers as you need:

```swift
class ExampleChainHandler: ChainHandlerProtocol {

    var currentHandler: HandlerProtocol?

    init(){
        /// Set Handlers
        currentHandler = HandlerObjectOne() // Your handler object
        let handler2 = HandlerObjectTwo()
        let handler3 = HandlerObjectThree()

        //MARK: All you have to do is make sure the predecessor sets a successor handler for the chain to continue.
        // Configureing successor
        currentHandler?.set(handler2)
        handler2.set(handler3)
    }
}
```
Now that everything is set, we can handle an object.

    5. Handel

```Swift
let handler = HandlerObject(type: .one, target: self)

let cor = ExampleChainHandler()
cor.handel(handler)
```

You can set different types of `HandlerObjects`

```swift
let handler = HandlerObject(type: HandlerType, target: Any)
let handler = HandlerObject(type: HandlerType, target: Any, userInfo: [AnyHashable : Any]?)
let handler = HandlerObject(type: HandlerType, target: Any, block: CORComplitionBlock, failureBlock: CORFailureBlock?)
let handler = HandlerObject(type: HandlerType, target: Any, userInfo: [AnyHashable : Any]?, block: CORComplitionBlock, failureBlock: CORFailureBlock?)
```

You can pass `userInfo` or a `complitionBlock` && || `failureBlock`

Feel free to fork and suggest changes.


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).




















