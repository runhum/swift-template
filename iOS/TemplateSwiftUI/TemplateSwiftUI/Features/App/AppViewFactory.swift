//
//  AppViewFactory.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 12/08/2022.
//

import Foundation

struct AppViewFactory {
    private let container: Container
    init(container: Container) {
        self.container = container
    }

    func makeFirstView() -> FirstView {
        FirstView(viewModel: FirstViewModel(todoRepository: container.todoRepository))
    }

    func makeSecondView() -> SecondView {
        SecondView()
    }
}
