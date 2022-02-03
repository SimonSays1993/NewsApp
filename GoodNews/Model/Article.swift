//
//  Article.swift
//  GoodNews
//
//  Created by Simon Mcneil on 2021-01-27.
//

import Foundation

struct ArticleList: Decodable {
	let status: String
	let articles: [Article]
}

struct Article: Decodable {
	let title: String?
	let description: String?
}
