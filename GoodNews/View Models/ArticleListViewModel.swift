
import Foundation

//Adding a parent view model
struct ArticleListViewModel {
	let totalResults: Int
	var articles: [Article]
	
	func articleAtIndex(_ index: Int) -> ArticleViewModel {
		let article = self.articles[index]
		return ArticleViewModel(article: article)
	}
}

struct ArticleViewModel  {
	private let article: Article
	
	var title: String {
		return self.article.title ?? ""
	}
	
	var description: String {
		return self.article.description ?? ""
	}
	
	init(article: Article) {
		self.article = article
	}
}
