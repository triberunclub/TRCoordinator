//
//  UniversalLink.swift
//  FoodMate
//
//  Created by Francesco Leoni on 15/02/24.
//

import Foundation

/// A struct representing a deep link within an app's navigation system.
public struct UniversalLink {
	// MARK: - Stored Properties

	/// The action associated with the deep link.
	public let path: String

	/// The route or destination associated with the deep link.
	public let route: NavigationRoute

	/// A set of parameters associated with the deep link.
	public let params: Set<String>

	// MARK: - Init

	public init(
		path: String,
		route: NavigationRoute,
		params: Set<String> = []
	) {
		self.path = path
		self.route = route
		self.params = params
	}
}

extension UniversalLink: Hashable {

	public static func == (lhs: UniversalLink, rhs: UniversalLink) -> Bool {
		lhs.path == rhs.path
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(path)
	}
}
