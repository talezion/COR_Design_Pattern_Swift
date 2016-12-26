//
//  ViewController.swift
//  COR_Swift
//
//  Created by Tal Zion on 26/12/2016.
//  Copyright © 2016 Tal Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let handler = HandlerObject(type: .one, target: self)
        let cor = ExampleChainHandler()
        cor.handel(handler)
    }
}

