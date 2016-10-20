//
//  ChainProtocols.swift
//  COR-Design-Patern-Swift
//
//  Created by Tal Zion on 20/10/2016.
//  Copyright © 2016 IDZ Consultancy. All rights reserved.
//

import Foundation

///Handler object protocol sets the object type
protocol HandlerObjectProtocol {
    var type:HandlerType { get }
    var target:AnyObject { get }
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

struct HandlerObject: HandlerObjectProtocol {
    var type: HandlerType
    var target: AnyObject
}

protocol ChainHandlerProtocol {
    var currentHandler:HandlerProtocol? { get set }
}

///Starts the chain of responsibility
extension ChainHandlerProtocol {
    func handel(type:HandlerObjectProtocol) {
        self.currentHandler?.handel(type)
    }
}