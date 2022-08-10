//
//  Entities+GRDB.swift
//
//
//  Created by Runar Hummelsund on 30/03/2022.
//

import Entities
import Foundation
import GRDB

// MARK: GRDB conformances

extension AppConfiguration: TableRecord, FetchableRecord, PersistableRecord {}
extension Todo: TableRecord, FetchableRecord, PersistableRecord {}
