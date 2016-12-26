//
//  HandlerObjectTwo.swift
//  COR_Swift_Example
//
//  Created by Tal Zion on 25/12/2016.
//  Copyright © 2016 Tal Zion. All rights reserved.
//

import Foundation

//MARK: - Handler:

///Add Handler and conform to HandlerProtocol
class HandlerObjectTwo: HandlerProtocol {
    
    var nextHandler: HandlerProtocol?
    
    /// Where the magic happens
    func handel(_ object: HandlerObjectProtocol) {
        
        ///Check if the current type equals to currentHandler
        if HandlerType.two == object.type {
            
            /// MARK: Add logic here
            
            
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
