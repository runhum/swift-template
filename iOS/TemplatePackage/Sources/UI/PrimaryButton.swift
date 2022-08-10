//
//  PrimaryButton.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import SwiftUI

public struct PrimaryButtonModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .shadow(radius: 10)
    }
}

public extension Button {
    func primaryButtonStyle() -> some View {
        modifier(PrimaryButtonModifier())
    }
}
