//
//  CoordinatorFactory.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 5. 10. 23.
//

import SwiftUI
import TRCoordinator

@MainActor
protocol CoordinatorFactory {
    func makeTabsCoordinator(parent: Coordinator) -> TabsCoordinator
    func makeAuthCoordinator(parent: Coordinator) -> AuthCoordinator
    func makeCatalogCoordinator(parent: Coordinator) -> CatalogCoordinator
    func makeCartCoordinator(parent: Coordinator) -> CartCoordinator
}
