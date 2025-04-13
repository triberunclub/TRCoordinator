//
//  NavigationControllerCreatable.swift
//  TRCoordinator
//
//  Created by Luigi Aiello on 13/04/25.
//

import Foundation

@MainActor
protocol NavigationControllerCreatable {
	func makeTransitionDelegate(_ transitions: [Transitionable]) -> NavigationControllerTransitionDelegate
	func makeNavigationController(
		isNavigationBarHidden: Bool,
		delegate: NavigationControllerTransitionDelegate?
	) -> NavigationController
}
