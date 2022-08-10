//
//  AppDatabaseTests.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Entities
@testable import Persistence
import XCTest
class AppDatabaseTests: XCTestCase {
    var database: AppDatabase!
    override func setUpWithError() throws {
        database = try AppDatabase(type: .inMemory)
    }

    override func tearDownWithError() throws {
        database = nil
    }

    func testMigrate() throws {
        try database.migrate()
    }

    func testSeed() throws {
        try database.migrate()
        try database.seed()

        let todos = try database.queue.read { db in try Todo.fetchAll(db) }
        XCTAssertEqual(todos.count, 1)
    }
}
