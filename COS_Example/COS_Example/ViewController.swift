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
        
        let five = HandlerObject(type: .HandlerFive)
        
        let cor = ChainHandler()
        cor.handel(five)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

