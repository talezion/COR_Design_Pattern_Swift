//
//  COS-Design-Patern
//
//  Created by Tal Zion on 27/07/2016.
//  Copyright © 2016 tal-dev. All rights reserved.
//

// MARK: - Add handler types to handle request
enum HandlerType {
    
    ///TODO: Add handler types for each handler
    case HanlerExampleOne
    case HanlerExampleTwo
}

class ChainHandler: ChainHandlerProtocol {
    
    var currentHandler:HandlerProtocol?
    
    init(){
        
        self.currentHandler = HandlerOne()
        let handler2 = HandlerTwo()
        
        //Add more as needed
        /*
         let handler3 = HandlerThree()
         let handler4 = HandlerFour()
         let handler5 = HandlerFive()
         */
        
        /// Set next handler
        self.currentHandler?.set(handler2)
        
        /*
         handler2.set(handler3)
         handler3.set(handler4)
         handler4.set(handler5)
         */
    }
}



/* ------------------------------ */

//MARK: - Example:

///Add Handler and conform to HandlerProtocol
class HandlerOne: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    /// Where the magic happens
    func handel(type: HandlerObjectProtocol) {
        
        ///Check if the current type equals to currentHandler
        if HandlerType.HanlerExampleOne == type.type {
            
            /// TODO: Add logic here
            
        } else {
            
            ///Execute the next handler in the chain
            self.nextHandler?.handel(type)
            
        }
    }
}

///Add Handler and conform to HandlerProtocol
class HandlerTwo: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    /// Where the magic happens
    func handel(type: HandlerObjectProtocol) {
        
        ///Check if the current type equals to currentHandler
        if HandlerType.HanlerExampleTwo == type.type {
            
            /// TODO: Add logic here
            
        } else {
            
            ///Execute the next handler in the chain
            self.nextHandler?.handel(type)
            
            
            ///IMPORTANT NOTE: In case the current handler is the last in the chain, force a crash to make sure you handle all types:
            
            if nextHandler != nil {
                self.nextHandler?.handel(type)
            } else {
                fatalError("No handler takes care of me!")
            }
        }
    }
}

