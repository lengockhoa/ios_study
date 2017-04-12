//
//  ViewController.swift
//  WebView
//
//  Created by Le NK on 4/4/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "http://logistics.cosevco.vn")
        let requestObj = URLRequest(url: url!)
        myWebView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

