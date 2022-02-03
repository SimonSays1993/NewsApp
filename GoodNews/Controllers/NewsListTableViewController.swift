import UIKit

class NewsListTableViewController: UITableViewController {
	
	private var articleListViewModel: ArticleListViewModel?
	var counter = 1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		title = "Top News"
		let action = #selector(refreshDidStart(sender:event:))
		refreshControl = UIRefreshControl()
		refreshControl?.addTarget(self, action: action, for: .valueChanged)
        refreshControl?.tintColor = .white
	}
	
	@objc func refreshDidStart(sender: UIRefreshControl?, event: UIEvent?) {
		self.tableView.beginRefreshing()
		let url: URL!
		if counter.isMultiple(of: 2) {
			url = URL(string: "https://newsapi.org/v2/top-headlines?country=ca&apiKey=0e589e1500fc43e8b707fe4ad3657b92")
		} else {
			url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0e589e1500fc43e8b707fe4ad3657b92")
		}
		WebService().getArticles(url: url) { [weak self] articles in
			guard let self = self else { return }
			if let results = articles {
				self.articleListViewModel?.articles.removeAll()
				self.articleListViewModel = ArticleListViewModel(totalResults: results.articles.count, articles: results.articles)
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
					self.tableView.reloadData()
				}
			}
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
				self.tableView.endRefreshing()
			}
		}
		counter += 1
	}
	
	func setup() {
		tableView.estimatedRowHeight = 44
		tableView.rowHeight = UITableView.automaticDimension
		tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
		
		guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ca&apiKey=[insertKey]") else { return }
		
		WebService().getArticles(url: url) { [weak self] articles in
			guard let self = self else { return }
			if let results = articles {
				self.articleListViewModel = ArticleListViewModel(totalResults: results.articles.count, articles: results.articles)
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articleListViewModel?.totalResults ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell, let articleVM = articleListViewModel else {
			return UITableViewCell()
		}
		let articleViewModel = articleVM.articleAtIndex(indexPath.row)
		cell.configure(cell: articleViewModel)
		
		return cell
	}
}
