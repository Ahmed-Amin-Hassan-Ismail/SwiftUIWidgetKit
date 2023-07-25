//
//  TodoListView.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 25/07/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject private var viewModel = TodoListViewModel()
    
    
    var body: some View {
        NavigationView {
            
            List {
                
                ForEach(viewModel.todos ?? []) { todo in
                    
                    Text("\(todo.title): **\(todo.completed ? "completed" : "open")**")
                        .onTapGesture {
                            viewModel.isTodoSelected = true
                            viewModel.selectedTodo = todo
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("My Todo")
            .sheet(isPresented: $viewModel.isTodoSelected) {
                GroupBox {
                    selectedTodoView
                } label: {
                    Label("Todo #\(viewModel.selectedTodo?.id ?? 0)", systemImage: "person")
                }

            }
        }
    }
}

extension TodoListView {
    
    private var selectedTodoView: some View {
        
        VStack(alignment: .leading) {
        
            Text(viewModel.selectedTodo?.title ?? "")
                .font(.headline)
            
            Text((viewModel.selectedTodo?.completed ?? false) ? "Completed" : "Open" )
                .font(.subheadline)
                .foregroundColor((viewModel.selectedTodo?.completed ?? false) ? .green : .red)
            
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
