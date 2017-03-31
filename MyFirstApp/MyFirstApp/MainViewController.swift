//
//  ViewController.swift
//  MyFirstApp
//
//  Created by LeNK on 3/27/17.
//  Copyright © 2017 LeNK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var name: String = "12345"
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeName(){
        let str = label1.text
        label1.text = label2.text
        label2.text = str
        print("Hello 500 anh em")
    }


}

