//
//  ViewController.swift
//  baitapWebservice
//
//  Created by Le NK on 5/8/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

let urlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken&format=json&nojsoncallback=1"

class PhotoItem{
    
    var title: String = ""
    var urlString: String = ""
    var owner: String = ""
    
    init() {
    }
    
    init(title: String, urlString: String, owner: String) {
        self.title = title
        self.urlString = urlString
        self.owner = owner
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    
    var photoItems = [PhotoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url){[weak self](data, res, err) in
            if let data = data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: []){
                if let jsonDict = jsonData as? [String:Any]{
                    self?.parseJson(jsonDict : jsonDict)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                } else {
                    print("Error: invalid json")
                }
            }
        }
        task.resume()
    }
    
    func parseJson(jsonDict: [String: Any]){
        if let photos = jsonDict["photos"] as? [String: Any]{
            if let photo = photos["photo"] as? [[String: Any]]{
                photoItems = []
                for p in photo{
                    let photoItem = PhotoItem()
                    if let title = p["title"] as? String{
                        photoItem.title = title
                    }
                    if let urlString = p["url_h"] as? String{
                        photoItem.urlString = urlString
                    }
                    if let owner = p["owner"] as? String{
                        photoItem.owner = owner
                    }
                    photoItems.append(photoItem)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoItem = self.photoItems[indexPath.row]
        
        if indexPath.row % 3 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "featureCell")
            if let cell = cell as? FeatureCell{
                cell.titleLabel.text = photoItem.title
                cell.ownerLabel.text = photoItem.owner
                self.loadImage(cell: cell, photoItem: photoItem)
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "featureCell")
            // Test thử dùng 1 cell và ẩn cái owner label
            if let cell = cell as? FeatureCell{
                cell.titleLabel.text = photoItem.title
                self.loadImage(cell: cell, photoItem: photoItem)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 3 == 0 {
            return 300
        }else{
            return 150
        }
    }
    
    func loadImage(cell: FeatureCell, photoItem: PhotoItem){
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: photoItem.urlString)
        
        if url == nil {
            return
        }
        
        weak var weakCell = cell
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    weakCell?.photoView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
    
    func loadImageNormal(cell: NormalCell, photoItem: PhotoItem){
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: photoItem.urlString)
        
        if url == nil {
            return
        }
        
        weak var weakCell = cell
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    weakCell?.photoView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }

}

