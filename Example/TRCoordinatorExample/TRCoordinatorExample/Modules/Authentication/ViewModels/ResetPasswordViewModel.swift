//
//  ResetPasswordViewModel.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 25. 2. 25.
//

import Foundation
import TRCoordinator

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var isLoading = false
    
    private let coordinator: AuthCoordinator
    
    var isValid: Bool {
        !email.isEmpty && email.contains("@")
    }
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func onResetPasswordTap() async {
        coordinator.handle(AuthAction.showLogin)
    }
    
    func onBackToLoginTap() {
        coordinator.handle(AuthAction.showLogin)
    }
}
