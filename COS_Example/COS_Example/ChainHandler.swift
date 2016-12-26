//
//  ChainHandler.swift
//  COR_Swift_Example
//
//  Created by Tal Zion on 25/12/2016.
//  Copyright © 2016 Tal Zion. All rights reserved.
//

import Foundation

import Foundation

class ExampleChainHandler: ChainHandlerProtocol {
    
    var currentHandler: HandlerProtocol?
    
    init(){
        
        /// Set Handlers
        currentHandler = HandlerObjectOne()
        let handler2 = HandlerObjectTwo()
        
        // Configureing successor
        currentHandler?.set(handler2)
    }
}
