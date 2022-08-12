//
//  AppContainer.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation
import Persistence

protocol Container {}

/// Contains the app's dependencies
struct AppContainer: Container {
    private let fileManager: FileManager = .default
    private let database: AppDatabase

    init() throws {
        let databasePath = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("template.db")
            .path

        database = try AppDatabase(type: .persistent(path: databasePath))
        try database.migrate()
    }
}
