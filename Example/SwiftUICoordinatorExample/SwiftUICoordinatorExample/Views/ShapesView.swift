//
//  ShapesView.swift
//  SwiftUICoordinatorExample
//
//  Created by Erik Drobne on 08/03/2023.
//

import SwiftUI

struct ShapesView: View {

    @EnvironmentObject var coordinator: ShapesCoordinator
    @StateObject var viewModel = ViewModel()

    var body: some View {
        List {
            Section(header: Text("Simple")) {
                Button {
                    viewModel.didTapCircle()
                } label: {
                    Text("Circle")
                }

                Button {
                    viewModel.didTapRectangle()
                } label: {
                    Text("Rectangle")
                }

                Button {
                    viewModel.didTapSquare()
                } label: {
                    Text("Square")
                }
            }

            Section(header: Text("Featured")) {
                Button {
                    viewModel.didTapSquare(color: .blue)
                } label: {
                    Text("Blue Square")
                }
            }
        }
        .onAppear {
            viewModel.coordinator = coordinator
        }
    }
}

extension ShapesView {
    @MainActor class ViewModel: ObservableObject {
        var coordinator: ShapesCoordinator?

        func didTapCircle() {
            coordinator?.didTap(route: .circle)
        }

        func didTapRectangle() {
            coordinator?.didTap(route: .rectangle)
        }

        func didTapSquare(color: Color? = nil) {
            if let color {
                coordinator?.didTap(route: .square(.square(color: color)))

            } else {
                coordinator?.didTap(route: .square(nil))
            }
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static let coordinator = ShapesCoordinator()

    static var previews: some View {
        ShapesView()
            .environmentObject(coordinator)
    }
}
