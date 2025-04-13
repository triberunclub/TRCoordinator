//
//  StackNavigationRoute.swift
//  TRCoordinator
//
//  Created by Luigi Aiello on 13/04/25.
//

import Foundation

/// Protocol for stack-based navigation routes
@MainActor
public protocol StackNavigationRoute: NavigationRoute {
	/// Transition action to be used when the route is shown.
	var action: TransitionAction { get }

	/// A property that hides the back button during navigation
	var hidesBackButton: Bool? { get }
}

public extension StackNavigationRoute {
	var hidesBackButton: Bool? { nil }
}
