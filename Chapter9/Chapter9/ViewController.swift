//
//  ViewController.swift
//  Chapter9
//
//  Created by Le NK on 4/14/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: AnyObject){
        print("Call button taped")
        if let but = sender as? UISwitch{
            print("Is control on? \(but.isOn)")
        }
        if sender === button{
            print("OKOKOK Button")
        }
        print("Method: \(#function) in file: \(#file) line: \(#line) column: \(#column)")
        badMethod()
    }
    
    func badMethod(){
        let array = NSMutableArray()
        
        for i in 0..<10{
            array.insert(i, at: i)
        }
        for _ in 0...10{
            array.removeObject(at: 0)
        }
    }

}

