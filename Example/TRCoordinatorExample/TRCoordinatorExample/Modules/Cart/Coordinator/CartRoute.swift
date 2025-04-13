//
//  CartRoute.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 26. 2. 25.
//

import Foundation
import TRCoordinator

enum CartRoute: StackNavigationRoute {
    case cart
    case checkout
    
    var action: TransitionAction {
        return .push(animated: true)
    }
}
