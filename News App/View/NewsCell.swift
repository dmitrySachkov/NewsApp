//
//  NewsCell.swift
//  News App
//
//  Created by Дмитрий on 28.07.20.
//  Copyright © 2020 Sachkov Dmitry. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var publishedAtLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func updateUI(cellModel: NewsModel) {
        
        titleLbl.text = cellModel.title
        
        if let url = URL(string: cellModel.urlToImage) {
            
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url)
                    DispatchQueue.global().sync {
                        self.imageCell.image = UIImage(data: data)
                    }
                } catch {
                    
                }
            }
        } else {
            self.imageCell.image = UIImage(named: "2018-10-14 13.21.24")
        }
    }
}

