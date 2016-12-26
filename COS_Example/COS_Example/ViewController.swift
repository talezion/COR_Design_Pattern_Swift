//
//  ViewController.swift
//  COS_Example
//
//  Created by Tal Zion on 27/07/2016.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

