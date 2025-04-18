//
//  NavigationControllerFactory.swift
//
//
//  Created by Erik Drobne on 19. 10. 23.
//

import Foundation


/// A factory class for creating navigation controllers and their delegates.
@MainActor
public struct NavigationControllerFactory: NavigationControllerCreatable {
	// MARK: Init

	public init() {}

	// MARK: Implementations

	public func makeTransitionDelegate(_ transitions: [Transitionable]) -> NavigationControllerTransitionDelegate {
		let transitionHandler = NavigationControllerTransitionHandler(transitions: transitions)
		return NavigationControllerTransitionDelegate(transitionHandler: transitionHandler)
	}

	public func makeNavigationController(
		isNavigationBarHidden: Bool = true,
		delegate: NavigationControllerTransitionDelegate? = nil
	) -> NavigationController {
		return NavigationController(isNavigationBarHidden: isNavigationBarHidden, delegate: delegate)
	}
}
