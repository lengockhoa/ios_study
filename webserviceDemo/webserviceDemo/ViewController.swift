//
//  ViewController.swift
//  webserviceDemo
//
//  Created by Le NK on 5/3/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

let urlString = "https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken%20&format=json&nojsoncallback=1"

class PhotoItem{
    var id: String = ""
    var title: String = ""
    var urlString: String = ""
    
    init() {
    }
    

}


class ViewController: UIViewController {

    var photoItems = [PhotoItem]()
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let url = URL(string: urlString)!
        
        let dataTask = session.dataTask(with: url){(data, responese, error) in
//            print(error)
//            let dataString = String(data: data!, encoding: .utf8)
//            print(dataString)
            
            
            
//            let jsonData1 = try? JSONSerialization.jsonObject(with: data!, options: [])
//            let jsonData2 = try? JSONSerialization.jsonObject(with: data!, options: [])
//            print("OK")
            
//            if let data = data{
//                let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
//            }
            
            if let data = data{
                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let jsonDict = jsonData as? [String: Any]{
                        self.parseJson(jsonDict: jsonDict)
                    }
                }
            }
        }
        dataTask.resume()
    }

    
    func parseJson(jsonDict: [String: Any]){
        if let photos = jsonDict["photos"] as? [String: Any]{
            if let photo = photos["photo"] as? [[String: Any]]{
                print("count \(photo.count)")
                photoItems = []
                for p in photo {
                    let photoItem = PhotoItem()
                    print(p["title"] ?? "123")
                    photoItem.id = (p["id"] as? String) ?? ""
                    photoItem.title = (p["title"] as? String) ?? ""
                    photoItem.urlString = (p["url_h"] as? String) ?? ""
                    photoItems.append(photoItem)
                }
            }
        }
    }
    
    func loadImage( cell: UITableViewCell, photoItem: PhotoItem){
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = URL(string: photoItem.urlString)
        weak var weakcell = cell
        let task = session.dataTask(with: url!) {(data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                
                weakcell.photoView.image = UIImage(data: data)
        }
    }
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





