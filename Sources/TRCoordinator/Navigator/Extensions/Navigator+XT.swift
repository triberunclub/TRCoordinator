//
//  Navigator.swift
//
//
//  Created by Erik Drobne on 12/12/2022.
//

import SwiftUI

public typealias Routing = Coordinator & Navigator

// MARK: - Extensions

public extension Navigator where Self: RouterViewFactory {
	// MARK: - Public properties

	var viewControllers: [UIViewController] {
		return navigationController.viewControllers
	}

	var topViewController: UIViewController? {
		return navigationController.topViewController
	}

	var visibleViewController: UIViewController? {
		return navigationController.visibleViewController
	}

	// MARK: - Public methods

	func start() {
		show(route: startRoute)
	}

	func show(route: Route) {
		let viewController = self.hostingController(for: route)
		navigationController.isNavigationBarHidden = route.title == nil && route.hidesNavigationBar ?? true

		switch route.action {
		case .push(let animated):
			navigationController.pushViewController(viewController, animated: animated)

		case .present(let animated, let modalPresentationStyle, let delegate, let completion):
			present(
				viewController: viewController,
				animated: animated,
				modalPresentationStyle: modalPresentationStyle,
				delegate: delegate,
				completion: completion
			)
		}
	}

	func set(routes: [Route], animated: Bool = true) {
		let views = views(for: routes)
		updateNavigationBarVisibility(for: routes)
		navigationController.setViewControllers(views, animated: animated)
	}

	func append(routes: [Route], animated: Bool = true) {
		let views = views(for: routes)
		updateNavigationBarVisibility(for: routes)
		navigationController.setViewControllers(self.viewControllers + views, animated: animated)
	}

	func pop(animated: Bool = true) {
		navigationController.popViewController(animated: animated)
	}

	func popToRoot(animated: Bool = true) {
		if navigationController.presentedViewController != nil {
			navigationController.dismiss(animated: animated)
		}
		navigationController.popToRootViewController(animated: animated)
	}

	func dismiss(animated: Bool = true) {
		navigationController.dismiss(animated: animated)
	}

	// MARK: - Private methods

	private func present(
		viewController: UIViewController,
		animated: Bool,
		modalPresentationStyle: UIModalPresentationStyle,
		delegate: UIViewControllerTransitioningDelegate?,
		completion: (() -> Void)?
	) {
		if let delegate {
			viewController.modalPresentationStyle = .custom
			viewController.transitioningDelegate = delegate
		} else {
			viewController.modalPresentationStyle = modalPresentationStyle
		}

		navigationController.present(viewController, animated: animated, completion: completion)
	}

	private func updateNavigationBarVisibility(for routes: [Route]) {
		let hidesNavigationBar = routes.last?.hidesNavigationBar ?? true
		navigationController.isNavigationBarHidden = routes.last?.title == nil && hidesNavigationBar
	}
}
