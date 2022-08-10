//
//  AppContainer.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 10/08/2022.
//

import Foundation
import Persistence

/// Contains the app's dependencies
struct AppContainer {
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
