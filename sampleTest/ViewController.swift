//
//  ViewController.swift
//  sampleTest
//
//  Created by Mehdi on 10/16/16.
//  Copyright © 2016 mehdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items : [Book] = []
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrolView: UIScrollView!
    let WIDTH : CGFloat = 150
    let BASE_URL = URL(string: "http://shahreketabonline.com/api/product/getBestSellers?categoryId=49&count=10")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        indicator.isHidden = true
        loadItems()
        
    }

    
    
    func loadItems()
    {
        indicator.isHidden = false
        indicator.startAnimating()
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let request = URLRequest(url: BASE_URL!)
        let dataTask = session.dataTask(with: request) { data, response, error in
            print(data!)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject]
                
                if let books = json?["data"] as? [[String: AnyObject]] {
                    for book in books {
                        if let title = book["title"] as? String, let price = book["price"] as? String, let imgUrl = book["photo_url"]  as? String
                        {
                            let item = Book(title: title, price: price, imageUrl: imgUrl)
                            self.items.append(item)
                        }
                    }
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
            DispatchQueue.main.async {
                self.loadItemCelss()
            }
        }
        
        dataTask.resume()
    }
    
    func loadItemCelss()
    {
        let count = items.count
        var i = 1
        let width = scrolView.frame.height * (0.8)
        let y = scrolView.frame.height * (0.1)
        for item in items
        {
            let cell = CellView(title: item.title, price: item.price, imageUrl: item.imageUrl)
            
            scrolView.addSubview(cell)
            cell.frame = CGRect(x: -width + CGFloat(i) * width, y: y, width: width, height: width)
            i += 1
        }
        scrolView.contentSize = CGSize(width: CGFloat(count) * width, height: width)
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

