//
//  AuthAction.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 24. 2. 25.
//

import Foundation
import TRCoordinator

enum AuthAction: CoordinatorAction {
    case didLogin
    case didSignup
    case showLogin
    case showSignup
    case showResetPassword
}
