//
//  Migration.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Foundation
import GRDB

/// Types conforming to `Migration` will be able to migrate the database forward.
protocol Migration {
    var identifier: String { get }
    var migrate: (Database) throws -> Void { get }
}
