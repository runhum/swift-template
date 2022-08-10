//
//  TodoRepositoryTests.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Entities
import Persistence
@testable import Repositories
import XCTest

class TodoRepositoryTests: XCTestCase {
    var database: AppDatabase!
    var repository: TodoRepository!

    override func setUpWithError() throws {
        database = try AppDatabase(type: .inMemory)
        try database.migrate()
        repository = TodoRepository(database: database)
    }

    override func tearDownWithError() throws {
        database = nil
        repository = nil
    }

    func testFetchAll() async throws {
        try await database.queue.write { db in
            try Todo(id: 1, isComplete: false, text: "foo")
                .insert(db)
            try Todo(id: 2, isComplete: false, text: "bar")
                .insert(db)
        }

        let todos = try await repository.fetchAll()

        XCTAssertEqual(todos.count, 2)
        XCTAssertEqual(todos[0].notes, "foo")
        XCTAssertEqual(todos[1].notes, "bar")
    }
}
