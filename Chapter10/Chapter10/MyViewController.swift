//
//  ViewController.swift
//  Chapter10
//
//  Created by Le NK on 4/17/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class MyViewController: UIViewController{
    
    var  data = ["abc", "nnn", "xyz","YYHY"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension MyViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        
        cell!.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
}

extension MyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected at:" + data[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
