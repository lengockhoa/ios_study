//
//  ViewController.swift
//  Chapter10
//
//  Created by Le NK on 4/17/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    var data = ["Hello", "New", "World", "KAKA"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        
        cell!.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        print("SELECTED : " + data[row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

