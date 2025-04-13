//
//  CartViewModel.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 26. 2. 25.
//

import Foundation
import TRCoordinator

@MainActor
final class CartViewModel: ObservableObject {
    
    let items: [CartItem] = CartItem.mock
    private let coordinator: CartCoordinator
    
    init(coordinator: CartCoordinator) {
        self.coordinator = coordinator
    }
    
    func onBackButtonTap() {
        coordinator.handle(CartAction.dismissCart)
    }
    
    func onCheckoutButtonTap() {
        coordinator.handle(CartAction.showCheckout)
    }
}
