//
//  FirstView.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import SwiftUI

struct FirstView: View {
    @State private var viewModel: FirstViewModel
    init(viewModel: @autoclosure @escaping () -> FirstViewModel) {
        self._viewModel = State(initialValue: viewModel())
    }

    var body: some View {
        NavigationStack {
            List(viewModel.rows) { todo in
                HStack {
                    Toggle(todo.title, isOn: .constant(false))
                        .toggleStyle(.button)
//                Text(todo.title)
                }
            }
        }
        .task {
            await viewModel.fetchTodos()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(viewModel: FirstViewModel(todoRepository: PreviewAppContainer().todoRepository))
    }
}
