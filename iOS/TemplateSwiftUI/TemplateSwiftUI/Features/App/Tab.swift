//
//  Tab.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation
import SwiftUI

enum Tab {
    case first
    case second
}

// MARK: Metadata

extension Tab {
    var title: String {
        switch self {
        case .first: return "First"
        case .second: return "Second"
        }
    }

    var symbolName: String {
        switch self {
        case .first: return "star.fill"
        case .second: return "circle.fill"
        }
    }
}
