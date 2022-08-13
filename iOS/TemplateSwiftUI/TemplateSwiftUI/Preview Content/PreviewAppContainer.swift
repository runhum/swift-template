//
//  PreviewAppContainer.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 12/08/2022.
//

import Foundation
import Persistence
import Repositories

struct PreviewAppContainer: Container {
    var todoRepository: TodoRepositoryProtocol = TodoRepository(database: try! AppDatabase(type: .inMemory))
}
