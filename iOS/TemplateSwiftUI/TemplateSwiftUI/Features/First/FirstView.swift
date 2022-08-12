//
//  FirstView.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import SwiftUI
struct FirstViewModel {}

struct FirstView: View {
    @State private var viewModel: FirstViewModel
    init(viewModel: @autoclosure @escaping () -> FirstViewModel) {
        self._viewModel = State(initialValue: viewModel())
    }

    var body: some View {
        Text("First")
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(viewModel: FirstViewModel())
    }
}
