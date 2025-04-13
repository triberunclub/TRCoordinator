//
//  UniversalLinkHandling.swift
//  FoodMate
//
//  Created by Francesco Leoni on 15/02/24.
//

import Foundation

@MainActor
public protocol UniversalLinkHandling {
	/// The set of supported deep links.
	var links: Set<UniversalLink> { get }

	func link(for url: URL) -> UniversalLink?

	func params(for url: URL, and keys: Set<String>) throws -> [String: String]
}

public extension UniversalLinkHandling {
	/**
	 Returns deep link or nil for a given URL.
	 - Parameters:
	 - url: A URL that you want to match against registered deep links.

	 - Throws ``DeepLinkError``:
	 - `DeepLinkError.invalidScheme`: Thrown if the URL's scheme doesn't match the
	 expected scheme defined in the scheme property.
	 - `DeepLinkError.unknownURL`: Thrown if the URL doesn't have a recognised
	 action (host) that corresponds to any registered deep link.

	 - Returns: ``DeepLink`` or `nil`.
	 */
	func link(for url: URL) -> UniversalLink? {
		let path = url.path()
		return links.first { $0.path == path }
	}

	/**
	 Returns a dictionary of parameters for a given url and parameter keys.

	 - Parameters:
	 - url: A URL from which you want to extract query parameters.
	 - keys: A set of strings representing the keys for the query parameters you want to extract.

	 - Throws: An error of type ``DeepLinkError`` `invalidQueryString` in case of invalid query string.

	 - Returns: A `[String: String]` where the keys are the names of the query items and the values are their
	 corresponding values.
	 */
	func params(for url: URL, and keys: Set<String>) throws -> [String : String] {
		if keys.isEmpty {
			return [:]
		}

		guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems else {
			throw UniversalLinkError.missingQueryString
		}

		return queryItems
			.filter { keys.contains($0.name) }
			.reduce(into: [String: String]()) { result, queryItem in
				result[queryItem.name] = queryItem.value
			}
	}
}
