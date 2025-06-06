//
//  RootCoordinator.swift
//
//
//  Created by Erik Drobne on 5. 10. 23.
//

import SwiftUI
import OSLog

///  A coordinator responsible for managing the root navigation flow of the application.
///
/// The `RootCoordinator` class serves as the top-level coordinator in your application's coordinator hierarchy.
/// It initializes the main window and navigation controller, manages child coordinators, and registers
/// navigation transitions.
@MainActor
open class RootCoordinator: Coordinator {
	// MARK: Stored Properties

	/// RootCoordinator doesn't have a parent
	public let parent: Coordinator? = nil
	public var childCoordinators = [Coordinator]()

	public private(set) var window: UIWindow
	public private(set) var navigationController: NavigationController

	// MARK: Init

	public init(window: UIWindow, navigationController: NavigationController) {
		self.window = window
		self.navigationController = navigationController

		window.rootViewController = self.navigationController
		window.makeKeyAndVisible()
	}

	// MARK: Methods

	open func handle(_ action: CoordinatorAction) {
		Logger.coordinator.warning("Unhandled action: \(action.name) by \(self.name).")
	}
}
