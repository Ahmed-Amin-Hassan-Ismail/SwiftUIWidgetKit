//
//  Provider.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 26/07/2023.
//

import WidgetKit


struct Provider: TimelineProvider {
    
    typealias Entry = SimpleEntry
    
    private let service = TodoService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.placeholder(0)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let todos = try await service.fetchTodoList()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: Date(), todos: fiveTodos)
                
                completion(entry)
                 
            } catch {
                
                let entry = SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)])
                completion(entry)
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            do {
                let todos = try await service.fetchTodoList()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: Date(), todos: fiveTodos)
                let timeLine = Timeline(entries: [entry], policy: .after(Date().advanced(by: 60 * 60 * 30)))
                
                completion(timeLine)
                
            } catch {
                
                let entries = [SimpleEntry(date: Date(), todos: [.placeholder(0)]), SimpleEntry(date: Date(), todos: [.placeholder(1)])]
                
                let timeLine = Timeline(entries: entries, policy: .after(Date().advanced(by: 60 * 60 * 30)))
                
                completion(timeLine)
            }
        }
    }
}
