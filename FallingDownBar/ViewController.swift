//
//  ViewController.swift
//  FallingDownBar
//
//  Created by Sharma Elanthiraiyan on 30/10/15.
//  Copyright © 2015 Sharma Elanthiraiyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bottomLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createViews() {
        self.bottomLine = UIView(frame: CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, 2))
        self.bottomLine.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.bottomLine)
    }
    
    func setUpAnimation() {
        
    }
}

