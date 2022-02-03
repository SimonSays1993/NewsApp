
import Foundation

class WebService {
	
	func getArticles(url: URL, completion: @escaping (ArticleList?) -> ()) {
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				print(error.localizedDescription)
				completion(nil)
			} else if let data = data {
				do {
					let articlesList = try JSONDecoder().decode(ArticleList.self, from: data)
					completion(articlesList)
				} catch {
					print(error.localizedDescription)
				}
			}
		}.resume()
	}
}
