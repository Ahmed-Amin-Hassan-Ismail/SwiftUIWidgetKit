//
//  TodoListViewModel.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 25/07/2023.
//

import Foundation

final class TodoListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var todos: [Todo]?
    @Published var selectedTodo: Todo?
    
    @Published var isTodoSelected: Bool = false
    
    private lazy var service = TodoService()
    
    
    // MARK: - Init
    
    init() {
        
        Task {
            await getAllTodo()
        }
    }
    
    @MainActor
    func getAllTodo() async {
        
        do {
                        
            self.todos = try await service.fetchTodoList()
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    
    func getSelectedTodo() async {
        
        do {
            
            
        } catch {
            
            print(error.localizedDescription)
            
        }
    }
    
}
