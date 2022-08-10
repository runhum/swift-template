//
//  Version1.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Foundation
import GRDB

struct Version1: Migration {
    let identifier: String = "v1"
    let migrate: (Database) throws -> Void = { db in
        
        try db.create(table: "appConfiguration") { table in
            // Single row guarantee
            table.column("id", .integer)
                // Have inserts replace the existing row
                .primaryKey(onConflict: .replace)
                // Make sure the id column is always 1
                .check { $0 == 1 }

            table.column("isOnboardingComplete", .boolean)
                .notNull()
        }

        try db.create(table: "todo") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("isComplete", .boolean)
                .notNull()
            table.column("text", .text)
        }
    }
}
