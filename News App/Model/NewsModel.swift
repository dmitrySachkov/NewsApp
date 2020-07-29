//
//  NewsModel.swift
//  News App
//
//  Created by Дмитрий on 28.07.20.
//  Copyright © 2020 Sachkov Dmitry. All rights reserved.
//

import Foundation

class NewsModel {
    
    let title: String
    let description: String
    let publishedAt: String
    let urlToImage: String
    let url: String
    
    init(title: String, description: String, publishedAt: String, urlToImage: String, urlTo: String) {
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.urlToImage = urlToImage
        self.url = urlTo
    }
    
    
    
}
