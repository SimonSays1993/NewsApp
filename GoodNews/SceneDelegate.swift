//
//  SceneDelegate.swift
//  GoodNews
//
//  Created by Simon Mcneil on 2021-01-26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		
		/* Need the code below for large title nav bar custom background colors if you're not using a storyboard. If large titles is disabled then just change tint color
		   - UINavigationBar.appearance().tintColor = color
		*/
		let headerColor: UIColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)

		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = headerColor
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
		
		let navController = UINavigationController.init(rootViewController: NewsListTableViewController())
		navController.navigationBar.prefersLargeTitles = true
		navController.navigationBar.topItem?.title = "Top News"

		navController.navigationBar.standardAppearance = appearance
		navController.navigationBar.compactAppearance = appearance
		navController.navigationBar.scrollEdgeAppearance = appearance
		
		self.window?.rootViewController = navController
		self.window?.makeKeyAndVisible()
		window?.makeKeyAndVisible()
	}
}

