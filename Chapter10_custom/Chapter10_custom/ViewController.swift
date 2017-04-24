//
//  ViewController.swift
//  Chapter10_custom
//
//  Created by Le NK on 4/17/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class Player{
    var name: String
    var thumbnail: String
    
    init(name: String, thumbnail: String) {
        self.name = name
        self.thumbnail = thumbnail
    }
}

class ViewController: UIViewController{
    
    var data = [
        Player(name: "messi", thumbnail: "meme"),
        Player(name: "kaka", thumbnail: "kaka"),
        Player(name: "ronaldo", thumbnail: "roro"),
        ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if let cell = cell as? MyCustomCell{
            cell.nameLabel.text = data[indexPath.row].name
            cell.thumbnailImage.image = UIImage(named: data[indexPath.row].thumbnail)
            
        }
        
        return cell!
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected at:" + data[indexPath.row].name)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


