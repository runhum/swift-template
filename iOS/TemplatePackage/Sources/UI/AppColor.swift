//
//  File.swift
//
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation

public enum AppColor: String {
    case primary
    case secondary
    case tertiary
    case text
}

#if canImport(SwiftUI)
import SwiftUI
public extension AppColor {
    var color: Color { Color(rawValue, bundle: .module) }
}
#endif
