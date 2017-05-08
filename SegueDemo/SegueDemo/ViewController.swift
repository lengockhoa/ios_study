//
//  ViewController.swift
//  SegueDemo
//
//  Created by Le NK on 4/24/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextClick(_ sender: UIButton){
        self.performSegue(withIdentifier: "Segue1", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier ?? "")
        let kkk = fieldfield.text
        if let nextViewController = segue.destination as? NextViewController {
            nextViewController.message?.text = kkk
        }
    }
    @IBAction func unwindSegue1(segue: UIStoryboardSegue){
        print("Unwind Segue1")
    }
}

