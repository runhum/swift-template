//
//  TodoRepository.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Entities
import Foundation
import Persistence

public protocol TodoRepositoryProtocol {
    func fetchAll() async throws -> [Todo]
}

public struct TodoRepository {
    private let database: AppDatabase
    public init(database: AppDatabase) {
        self.database = database
    }
}

extension TodoRepository: TodoRepositoryProtocol {
    public func fetchAll() async throws -> [Todo] {
        try await database.queue.read { db in
            try Todo.fetchAll(db)
        }
    }
}
