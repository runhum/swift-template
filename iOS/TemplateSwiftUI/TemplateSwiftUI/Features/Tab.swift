//
//  Tab.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation

enum Tab {
    case first
    case second
}

extension Tab {
    var title: String {
        switch self {
        case .first: return "First"
        case .second: return "Second"
        }
    }
}
