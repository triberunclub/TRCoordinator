//
//  NavigationControllerDelegateProxy.swift
//
//
//  Created by Erik Drobne on 19. 10. 23.
//

import UIKit

/// A delegate class responsible for managing navigation controller transitions by providing animation controllers.
///
/// This class acts as a bridge between the navigation controller and the transition handling process. It delegates
/// the responsibility of providing animations to the associated `NavigationControllerTransitionHandler`.
///
/// - Note: To use this class effectively, ensure that you initialize it with an appropriate
///   `NavigationControllerTransitionHandler` instance.
@MainActor
public final class NavigationControllerTransitionDelegate: NSObject, UINavigationControllerDelegate {
	// MARK: Stored Properties

	let transitionHandler: NavigationControllerTransitionHandler

	// MARK: Init

	init(transitionHandler: NavigationControllerTransitionHandler) {
		self.transitionHandler = transitionHandler
	}

	// MARK: Delegate

	public func navigationController(
		_ navigationController: UINavigationController,
		animationControllerFor operation: UINavigationController.Operation,
		from fromVC: UIViewController,
		to toVC: UIViewController
	) -> UIViewControllerAnimatedTransitioning? {
		return transitionHandler.navigationController(
			navigationController,
			animationControllerFor: operation,
			from: fromVC,
			to: toVC
		)
	}
}
