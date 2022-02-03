//
//  AppDelegate.swift
//  GoodNews
//
//  Created by Simon Mcneil on 2021-01-26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		/* Need the code below for large title nav bar custom background colors if you use a storyBoard. If large titles is disabled then just change tint color
		   - UINavigationBar.appearance().tintColor = color
		*/
//		let headerColor: UIColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
//
//		let appearance = UINavigationBarAppearance()
//		appearance.backgroundColor = headerColor
//		appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//		UINavigationBar.appearance().tintColor = .white
//		UINavigationBar.appearance().standardAppearance = appearance
//		UINavigationBar.appearance().compactAppearance = appearance
//		UINavigationBar.appearance().scrollEdgeAppearance = appearance


		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

