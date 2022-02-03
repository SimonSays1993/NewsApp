import UIKit

public extension UITableView {
	
	func beginRefreshing() {
		// Make sure that a refresh control to be shown was actually set on the view
		// controller and the it is not already animating. Otherwise there's nothing
		// to refresh.
		guard let refreshControl = refreshControl, !refreshControl.isRefreshing else {
			return
		}
		
		// Start the refresh animation
		refreshControl.beginRefreshing()
		
		// Make the refresh control send action to all targets as if a user executed
		// a pull to refresh manually
		refreshControl.sendActions(for: .valueChanged)
	}
	
	func endRefreshing() {
		refreshControl?.endRefreshing()
	}
}
