//
//  TodoService.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 25/07/2023.
//

import Foundation

final class TodoService {
    
    
    func fetchTodoList() async throws -> [Todo] {
        
        let todos: [Todo] = try await NetworkManager.shared.fetchRequest(from: "todos/")
        
        return todos
    }
    
    
    func getTodo(with id: Int) async throws -> Todo {
        
        let todo: Todo = try await NetworkManager.shared.fetchRequest(from: "todos/\(id)")
        
        return todo
    }
}
