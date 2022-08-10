//
//  AppView.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import SwiftUI

struct AppView: View {
    @State private var tab: Tab = .first
    
    var body: some View {
        TabView(selection: $tab) {
            FirstView()
                .tabItem {
                    Label(Tab.first.title, systemImage: Tab.first.symbolName)
                }
                .tag(Tab.first)

            SecondView()
                .tabItem {
                    Label(Tab.second.title, systemImage: Tab.second.symbolName)
                }
                .tag(Tab.second)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
