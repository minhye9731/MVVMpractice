//
//  Article.swift
//  MVVMpractice
//
//  Created by 강민혜 on 1/21/23.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
