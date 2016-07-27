enum HandlerType {
    case HanlerOne
    case HandlerTwo
    case HandlerThree
    case HandlerFour
    case HandlerFive
}

protocol HandlerObjectProtocol {
    var type:HandlerType { get set }
}

protocol HandlerProtocol: class {
    weak var nextHandler:HandlerProtocol? { get set }
    func handel(type: HandlerObjectProtocol)
}

extension HandlerProtocol {
    
    func set(handler:HandlerProtocol){
        self.nextHandler = handler
    }
}

class HandlerOne: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(type: HandlerObjectProtocol) {
        if HandlerType.HanlerOne == type.type {
            print("I am \(HandlerType.HanlerOne)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.HanlerOne)")
        }
    }
}

class HandlerTwo: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(type: HandlerObjectProtocol) {
        if HandlerType.HandlerTwo == type.type {
            print("I am \(HandlerType.HandlerTwo)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.HandlerTwo)")
        }
    }
}

class HandlerThree: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(type: HandlerObjectProtocol) {
        if HandlerType.HandlerThree == type.type {
            print("I am \(type.type)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.HandlerThree)")
        }
    }
}

class HandlerFour: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(type: HandlerObjectProtocol) {
        if HandlerType.HandlerFour == type.type {
            //TODO
        } else {
            if self.nextHandler != nil {
                self.nextHandler?.handel(type)
            } else {
                fatalError("No one to take care of me")
            }
        }
    }
}

class HandlerFive: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    func handel(type: HandlerObjectProtocol) {
        if HandlerType.HandlerFive == type.type {
            print("I am \(type.type)")
        } else {
            self.nextHandler?.handel(type)
            print("I am not \(HandlerType.HandlerFive)")
        }
    }
}

struct HandlerObject: HandlerObjectProtocol {
    var type: HandlerType
    
}

protocol ChainHandlerProtocol {
    weak var currentHandler:HandlerProtocol? { get set }
}

extension ChainHandlerProtocol {
    func handel(type:HandlerObjectProtocol) {
        self.currentHandler?.handel(type)
    }
}

class ChainHandler: ChainHandlerProtocol {
    
    weak var currentHandler:HandlerProtocol?
    
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