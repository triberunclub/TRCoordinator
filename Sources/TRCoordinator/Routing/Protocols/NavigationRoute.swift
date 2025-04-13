//
//  NavigationRoute.swift
//  TRCoordinator
//
//  Created by Luigi Aiello on 13/04/25.
//

import Foundation

@MainActor
public protocol NavigationRoute {
	/// Use this title to set the navigation bar title when the route is displayed.
	var title: String? { get }

	/// A property that provides the info about the appearance and styling of a route in the navigation system.
	var appearance: RouteAppearance? { get }

	/// A property that hides the navigation bar
	var hidesNavigationBar: Bool? { get }
}

public extension NavigationRoute {
	var title: String? { return nil }
	var appearance: RouteAppearance? { return nil }
	var hidesNavigationBar: Bool? { return nil }
}
