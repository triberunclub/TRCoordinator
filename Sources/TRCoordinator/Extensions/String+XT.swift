//
//  File.swift
//  TRCoordinator
//
//  Created by Luigi Aiello on 13/04/25.
//

import Foundation

extension String {

	var urlDecoded: String? {
		self.removingPercentEncoding?.replacingOccurrences(of: "+", with: " ")
	}
}
