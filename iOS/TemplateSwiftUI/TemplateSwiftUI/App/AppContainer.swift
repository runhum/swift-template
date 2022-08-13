//
//  AppContainer.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation
import Persistence
import Repositories

protocol Container {
    var todoRepository: TodoRepositoryProtocol { get }
}

/// Contains the app's dependencies
struct AppContainer: Container {
    private let fileManager: FileManager = .default
    private let database: AppDatabase

    let todoRepository: TodoRepositoryProtocol

    init() throws {
        let databasePath = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("template.db")
            .path

        database = try AppDatabase(type: .persistent(path: databasePath))
        try database.migrate()
        try database.seed()
        
        todoRepository = TodoRepository(database: database)
    }
}
