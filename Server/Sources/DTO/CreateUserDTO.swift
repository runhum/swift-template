//
//  CreateUserDTO.swift
//
//
//  Created by Runar Hummelsund on 13/10/2022.
//

import Foundation

public struct CreateUserDTO: Codable {
    public let name: String
    public init(name: String) {
        self.name = name
    }
}
