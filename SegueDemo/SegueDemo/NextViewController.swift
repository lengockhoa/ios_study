//
//  NextViewController.swift
//  SegueDemo
//
//  Created by Le NK on 4/24/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickBack(_ sender: UIButton){
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
        self.performSegue(withIdentifier: "unwindSegue1", sender: nil)
    }

}
