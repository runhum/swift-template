//
//  Todo.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Foundation

public struct Todo: Codable {
    public var id: Int64?
    public var isComplete: Bool
    public var notes: String?

    public init(id: Int64? = nil, isComplete: Bool, text: String?) {
        self.id = id
        self.isComplete = isComplete
        self.notes = text
    }
}
