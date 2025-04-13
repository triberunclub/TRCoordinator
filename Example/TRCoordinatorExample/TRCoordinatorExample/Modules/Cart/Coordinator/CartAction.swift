//
//  CartAction.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 26. 2. 25.
//

import Foundation
import TRCoordinator

enum CartAction: CoordinatorAction {
    case dismissCart
    case showCheckout
    case dismissCheckout
    case didPurchase
}
