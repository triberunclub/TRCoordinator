//
//  CatalogAction.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 25. 2. 25.
//

import Foundation
import TRCoordinator

enum CatalogAction: CoordinatorAction {
    case showCart
    case showProduct(ProductItem)
    case dismissProductDetails
    case addedToCart
}
