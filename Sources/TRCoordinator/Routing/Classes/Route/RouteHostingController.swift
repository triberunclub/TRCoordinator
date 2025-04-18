//
//  RouteHostingController.swift
//
//
//  Created by Erik Drobne on 15/05/2023.
//

import SwiftUI

@MainActor
public class RouteHostingController<Content: View>: UIHostingController<Content>, RouteProvider {
	// MARK: - Stored properties

	/// The navigation route associated with this hosting controller.
	public let route: NavigationRoute

	// MARK: - Init

	init(
		rootView: Content,
		route: NavigationRoute
	) {
		self.route = route
		super.init(rootView: rootView)

		if let tabBarRoute = route as? any TabBarNavigationRoute {
			self.tabBarItem = tabBarRoute.tabBarItem
		}
	}

	@objc required dynamic init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	public override func viewDidLoad() {
		super.viewDidLoad()

		if let appearance = route.appearance {
			self.view.backgroundColor = appearance.background
		}

		if let stackRoute = route as? any StackNavigationRoute {
			if let hidesBackButton = stackRoute.hidesBackButton {
				self.navigationItem.setHidesBackButton(hidesBackButton, animated: false)
			}
		}
	}
}
