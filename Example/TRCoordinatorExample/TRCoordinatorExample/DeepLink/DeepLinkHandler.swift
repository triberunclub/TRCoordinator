//
//  DeepLinkHandler.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 15/09/2023.
//

import Foundation
import TRCoordinator

struct DeepLinkHandler: DeepLinkHandling {
    static let shared = DeepLinkHandler()

    let scheme = "coordinatorexample"
    let links: Set<DeepLink> = [
        DeepLink(action: "cart", route: CartRoute.cart)
    ]

    private init() {}
}
