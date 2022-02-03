
import Foundation

//Adding a parent view model
struct ArticleListViewModel {
	let articles: [Article]
	let context: ArticleContextViewModel
	
	var numberOfSections: Int {
		return 1
	}
	
	func numberOfRowsInSection(_ section: Int) -> Int {
		return self.articles.count
	}
	
	init(context: ArticleContextViewModel) {
		self.context = context
		self.articles = context.article
	}
	
	func articleAtIndex(_ index: Int) -> ArticleContextViewModel {
		let article = self.articles[index]
		
		return ArticleContextViewModel(title: article.title ?? "",
								description: article.description ?? "")
	}
}

struct ArticleContextViewModel  {
	let article: [Article]
	var title: String
	var description: String
}
