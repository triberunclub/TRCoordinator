//
//  Navigator.swift
//  TRCoordinator
//
//  Created by Luigi Aiello on 13/04/25.
//

import UIKit

/// A protocol for navigating and managing view controllers within a navigation stack.
@MainActor
public protocol Navigator: ObservableObject {
	associatedtype Route: StackNavigationRoute

	/**
	 Root controller of the navigation

	 `root` of type`NavigationController`
	 */
	var navigationController: UINavigationController { get }

	/// The starting route of the navigator.
	var startRoute: Route { get }

	/// This method should be called to start the flow and to show the view for the `startRoute`.
	func start()

	/// It creates a view for the route and adds it to the navigation stack.
	func show(route: Route)

	/// Creates views for routes, and replaces the navigation stack with the specified views.
	func set(routes: [Route], animated: Bool)

	/// Creates views for routes, and appends them on the navigation stack.
	func append(routes: [Route], animated: Bool)

	/// Pops the top view from the navigation stack.
	func pop(animated: Bool)

	/// Pops all the views on the stack except the root view.
	func popToRoot(animated: Bool)
	
	/// Dismisses the view.
	func dismiss(animated: Bool)
}
