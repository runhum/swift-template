//
//  AppDatabase.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Entities
import Foundation
import GRDB

public enum DatabaseType {
    case inMemory
    case persistent(path: String)
}

public struct AppDatabase {
    private let migrations: [Migration] = [Version1()]
    public let queue: DatabaseQueue

    public init(type: DatabaseType) throws {
        switch type {
        case .inMemory:
            queue = DatabaseQueue()
        case .persistent(let path):
            queue = try DatabaseQueue(path: path)
        }
    }
}

public extension AppDatabase {
    func migrate() throws {
        var migrator = DatabaseMigrator()

        migrations.forEach { migrator.registerMigration($0.identifier, migrate: $0.migrate) }
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif
        try migrator.migrate(queue)
    }

    func erase() async throws {
        try await queue.erase()
    }

    func seed() throws {
        let todo = Todo(title: "Complete SwiftUI Template", isComplete: false, text: "Hmm")

        try queue.write { db in
            if try Todo.fetchCount(db) == 0 {
                try todo.save(db)
            }
        }
    }
}
