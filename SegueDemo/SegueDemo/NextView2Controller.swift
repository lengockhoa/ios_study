//
//  NextView2Controller.swift
//  SegueDemo
//
//  Created by Le NK on 4/26/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class NextView2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClick(_ sender: UIButton){
        self.performSegue(withIdentifier: "Segue2", sender: sender)
    }

}
