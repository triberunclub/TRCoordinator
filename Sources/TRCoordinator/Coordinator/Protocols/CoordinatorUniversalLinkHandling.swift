//
//  CoordinatorUniversalLinkHandling.swift
//  FoodMate
//
//  Created by Francesco Leoni on 15/02/24.
//

import Foundation

@MainActor
public protocol CoordinatorUniversalLinkHandling {
	/// Takes universal link and its parameters and handles it.
	func handle(_ universalLink: UniversalLink, with params: [String: String], url: URL)
}
