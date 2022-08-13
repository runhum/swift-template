//
//  FirstViewModel.swift
//  TemplateSwiftUI
//
//  Created by Runar Hummelsund on 12/08/2022.
//

import Entities
import Foundation
import Repositories

struct FirstViewModel {
    private let todoRepository: TodoRepositoryProtocol
    var rows: [FirstViewRowViewModel] = []
    init(todoRepository: TodoRepositoryProtocol, rows: [FirstViewRowViewModel] = []) {
        self.todoRepository = todoRepository
        self.rows = rows
    }
}

extension FirstViewModel {
    mutating func fetchTodos() async {
        do {
            rows = try await todoRepository.fetchAll().map { todo in FirstViewRowViewModel(todo: todo) }
        } catch {
            // TODO: Show error
        }
    }
}

struct FirstViewRowViewModel: Identifiable {
    private let todo: Todo
    var id: Int64? { todo.id }
    var isCompleted: Bool { todo.isComplete }
    var title: String { todo.title }
    var notes: String { todo.notes ?? "" }
    init(todo: Todo) {
        self.todo = todo
    }
}
