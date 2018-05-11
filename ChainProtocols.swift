//
//  ChainProtocols.swift
//  COR_Swift_Example
//
//  Created by Tal Zion on 25/12/2016.
//  Copyright © 2016 Tal Zion. All rights reserved.
//

import Foundation

typealias CORComplitionBlock = Optional<((_ userInfo: [AnyHashable:Any]?)-> Void)>
typealias CORFailureBlock = Optional<((_ error: ChainError?) -> Void)>

/// Handler object protocol sets the object type
protocol HandlerObjectProtocol {
    var type:HandlerType { get }
    var target:Any { get }
    var userInfo:[AnyHashable:Any]? { get }
    var complitionBlock:CORComplitionBlock? { get set }
    var failureBlock:CORFailureBlock? { get set }
}

/// Defines the handler protocl, and successor
protocol HandlerProtocol: class {
    weak var nextHandler:HandlerProtocol? { get set }
    func handel(_ type: HandlerObjectProtocol)
}

extension HandlerProtocol {
    
    func set(_ handler:HandlerProtocol){
        self.nextHandler = handler
    }
}

// Create chains as many as needed and register handler objects
protocol ChainHandlerProtocol {
    var currentHandler:HandlerProtocol? { get set }
}

//Starts the chain of responsibility
extension ChainHandlerProtocol {
    func handel(_ type:HandlerObjectProtocol) {
        self.currentHandler?.handel(type)
    }
}

/// Handler Object 
struct HandlerObject: HandlerObjectProtocol {
    
    // userInfo to hasnle any system notifications
    internal var userInfo: [AnyHashable : Any]?
    
    // The type to the chain will catch
    var type: HandlerType
    
    // Any target that in necessary to handel the operation
    var target: Any
    
    // Complition & Failure blocks to support the readiness of the operation
    var complitionBlock:CORComplitionBlock?
    var failureBlock:CORFailureBlock?
    
    
    init(type: HandlerType, target: Any, userInfo: [AnyHashable:Any]? = nil, block: CORComplitionBlock, failureBlock: CORFailureBlock?) {
        self.type = type
        self.target = target
        self.userInfo = userInfo
        
        complitionBlock = block
        self.failureBlock = failureBlock
    }
    
    init(type: HandlerType, target: Any, userInfo: [AnyHashable:Any]? = nil) {
        self.type = type
        self.target = target
        self.userInfo = userInfo
        
        complitionBlock = nil
        failureBlock = nil
    }
}

enum ChainErrorKey:String {
    case NSLocalizedDescriptionKey
    case NSLocalizedRecoverySuggestionErrorKey
    case NSLocalizedFailureReasonErrorKey
    case NSLocalizedRecoveryOptionsErrorKey
    case NSRecoveryAttempterErrorKey
    case NSHelpAnchorErrorKey
    
    // Add more handlers
}

class ChainError: NSError {
    
    override init(domain: String, code: Int, userInfo dict: [AnyHashable : Any]? = nil) {
        super.init(domain: domain, code: code, userInfo: dict)
    }
    convenience init(code: Int, userInfo dict: [ChainErrorKey : Any]? = nil) {
        self.init(domain: "ChainErrorDomain", code: code, userInfo: dict)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
