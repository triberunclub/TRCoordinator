//
//  View+Utilities.swift
//  
//
//  Created by Erik Drobne on 22/05/2023.
//

import SwiftUI

extension View {
	@ViewBuilder
	func ifLet<T, Content: View>(_ value: T?, modifier: (Self, T) -> Content) -> some View {
		if let value {
			modifier(self, value)
		} else {
			self
		}
	}

	@ViewBuilder
	func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
		if conditional {
			content(self)
		} else {
			self
		}
	}
}
