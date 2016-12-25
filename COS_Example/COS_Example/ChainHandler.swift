enum HandlerType {
    case hanlerOne
    case handlerTwo
    case handlerThree
    case handlerFour
    case handlerFive
    case handlerSix
}

protocol HandlerObjectProtocol {
    var type:HandlerType { get set }
}

protocol HandlerProtocol: class {
    weak var nextHandler:HandlerProtocol? { get set }
    func handel(_ type: HandlerObjectProtocol)
}

extension HandlerProtocol {
    
    func set(_ handler:HandlerProtocol){
        self.nextHandler = handler
    }
}

class HandlerOne: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(_ type: HandlerObjectProtocol) {
        if HandlerType.hanlerOne == type.type {
            print("I am \(HandlerType.hanlerOne)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.hanlerOne)")
        }
    }
}

class HandlerTwo: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(_ type: HandlerObjectProtocol) {
        if HandlerType.handlerTwo == type.type {
            print("I am \(HandlerType.handlerTwo)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.handlerTwo)")
        }
    }
}

class HandlerThree: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(_ type: HandlerObjectProtocol) {
        if HandlerType.handlerThree == type.type {
            print("I am \(type.type)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.handlerThree)")
        }
    }
}

class HandlerFour: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(_ type: HandlerObjectProtocol) {
        if HandlerType.handlerFour == type.type {
            print("I am \(type.type)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.handlerFour)")
        }
    }
}

class HandlerFive: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(_ type: HandlerObjectProtocol) {
        if HandlerType.handlerFive == type.type {
            print("I am \(type.type)")
        } else {
            if self.nextHandler != nil {
                print("I am not \(HandlerType.handlerFive)")
                self.nextHandler?.handel(type)
            } else {
                fatalError("No one to take care of me")
            }
        }
    }
}

struct HandlerObject: HandlerObjectProtocol {
    var type: HandlerType
    
}

protocol ChainHandlerProtocol {
    var currentHandler:HandlerProtocol? { get set }
}

extension ChainHandlerProtocol {
    func handel(_ type:HandlerObjectProtocol) {
        self.currentHandler?.handel(type)
    }
}

class ChainHandler: ChainHandlerProtocol {
    
    var currentHandler:HandlerProtocol?
    
    init(){
        
        self.currentHandler = HandlerOne()
        let handler2 = HandlerTwo()
        let handler3 = HandlerThree()
        let handler4 = HandlerFour()
        let handler5 = HandlerFive()
        
        self.currentHandler?.set(handler2)
        handler2.set(handler3)
        handler3.set(handler4)
        handler4.set(handler5)
    }
}
