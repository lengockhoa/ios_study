//
//  ViewController.swift
//  baiWebservice
//
//  Created by Le NK on 5/5/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

let urlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken&format=json&nojsoncallback=1"

class PhotoItem {
    var id: Int = 0
    var title: String = ""
    var urlString: String = ""
    
    init() {
    }
    
    init(id: Int, title: String, urlString: String) {
        self.id = id
        self.title = title
        self.urlString = urlString
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var photoItems = [PhotoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url) {[weak self](data, res, err) in
            print("error: \(err.debugDescription)")
            
            if let data = data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) {
                if let jsonDict = jsonData as? [String: Any] {
                    self?.parseJson(jsonDict: jsonDict)
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                    
                }
                else
                {
                    print("Error: invalid json")
                }
            }
            
        }
        task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parseJson(jsonDict: [String: Any]){
        if let photos = jsonDict["photos"] as? [String: Any] {
            if let photo = photos["photo"] as? [[String: Any]] {
                print("count: \(photo.count)")
                
                photoItems = []
                for p in photo {
                    let photoItem = PhotoItem()
                    
                    if let id = p["id"] as? String {
                        photoItem.id = Int(id) ?? 0
                    }
                    
                    if let title = p["title"] as? String {
                        photoItem.title = title
                    }
                    
                    if let urlString = p["url_h"] as? String {
                        photoItem.urlString = urlString
                    }
                    
                    photoItems.append(photoItem)
                    //photoItem.id = (p["id"] as? Int) ?? 0
                    //photoItem.title = (p["title"] as? String) ?? ""
                    //photoItem.urlString = (p["url_h"] as? String) ?? ""
                }
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoItem = self.photoItems[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "featureCell") as? FeatureCell {
            cell.titleLabel.text = photoItem.title
            //cell.photoView.setImageWithURL()
            self.loadImage(cell: cell, photoItem: photoItem)
            
            
            return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoItems.count
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

    
}

