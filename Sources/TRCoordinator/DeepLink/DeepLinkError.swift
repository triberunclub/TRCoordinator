//
//  DeepLinkError.swift
//  
//
//  Created by Erik Drobne on 13/09/2023.
//

import Foundation

public enum DeepLinkError: Error {
	/// Invalid scheme.
	case invalidScheme

	// Unknown URL.
	case unknownURL
}

public enum DeepLinkParamsError: Error {
	// Missing query params.
	case missingQueryString
}
