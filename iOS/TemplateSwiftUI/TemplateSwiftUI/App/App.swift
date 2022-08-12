//
//  TemplateSwiftUIApp.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import SwiftUI

@main
struct TemplateSwiftUIApp: App {
    private let container = try! AppContainer()

    var body: some Scene {
        WindowGroup {
            AppView(viewFactory: AppViewFactory(container: container))
        }
    }
}
