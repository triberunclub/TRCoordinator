//
//  SignupViewModel.swift
//  TRCoordinatorExample
//
//  Created by Erik Drobne on 25. 2. 25.
//

import SwiftUI
import TRCoordinator

@MainActor
final class SignupViewModel: ObservableObject {
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var acceptedTerms: Bool = false
    @Published var isLoading = false
    
    var isValid: Bool {
        !fullName.isEmpty &&
        !email.isEmpty &&
        email.contains("@") &&
        password.count >= 8 &&
        password == confirmPassword &&
        acceptedTerms
    }
    
    private let coordinator: AuthCoordinator
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func onSignupTap() async {
        guard !isLoading else {
            return
        }
        coordinator.handle(AuthAction.didSignup)
    }
    
    func onLoginTap() {
        coordinator.handle(AuthAction.showLogin)
    }
}
