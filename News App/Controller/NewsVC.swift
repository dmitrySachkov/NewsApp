//
//  ViewController.swift
//  News App
//
//  Created by Дмитрий on 28.07.20.
//  Copyright © 2020 Sachkov Dmitry. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var news = [NewsModel]()
    
    final let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-26&sortBy=publishedAt&apiKey=61545de6eba74d57a19e3f700898bc79")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func getData() {
        DispatchQueue.global().async {
            Alamofire.request(self.url!).responseJSON { response in
                guard let value = response.result.value else { return }
                let json = JSON(value)
                
                for i in json["articles"] {
                    let title = i.1["title"].stringValue
                    let urlToImage = i.1["urlToImage"].stringValue
                    let url = i.1["url"].stringValue
                    let desc = i.1["description"].stringValue
                    let published = i.1["publishedAt"].stringValue
                    
                    self.news.append(NewsModel(title: title, description: desc, publishedAt: published, urlToImage: urlToImage, urlTo: url))
                    self.tableView.reloadData()
                    print(self.news.count)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
        let category = news[indexPath.row]
        cell.updateUI(cellModel: category)
        return cell
    }
}

