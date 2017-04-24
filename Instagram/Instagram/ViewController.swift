//
//  ViewController.swift
//  Instagram
//
//  Created by Le NK on 4/24/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class Contact{
    var name: String
    var thumbnail : String
    
    init(name: String, thumbnail: String) {
        self.name = name
        self.thumbnail = thumbnail
    }
}

class ViewController: UIViewController {
    
    var data = [
        Contact(name: "Name 1", thumbnail: "name1"),
        Contact(name: "Name 2", thumbnail: "name2"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "myCell1")
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "myCell2")
        
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
