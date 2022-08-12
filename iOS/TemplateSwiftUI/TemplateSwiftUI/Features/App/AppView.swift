//
//  AppView.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import SwiftUI

struct AppView: View {
    private let viewFactory: AppViewFactory
    @State private var tab: Tab = .first
    init(viewFactory: AppViewFactory) {
        self.viewFactory = viewFactory
    }

    var body: some View {
        TabView(selection: $tab) {
            viewFactory.makeFirstView()
                .tabItem {
                    Label(Tab.first.title, systemImage: Tab.first.symbolName)
                }
                .tag(Tab.first)

            viewFactory.makeSecondView()
                .tabItem {
                    Label(Tab.second.title, systemImage: Tab.second.symbolName)
                }
                .tag(Tab.second)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(viewFactory: AppViewFactory(container: PreviewAppContainer()))
    }
}
