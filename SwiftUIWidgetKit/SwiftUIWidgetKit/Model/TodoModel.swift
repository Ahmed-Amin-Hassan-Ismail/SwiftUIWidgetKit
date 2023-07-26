//
//  TodoModel.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 25/07/2023.
//

import Foundation


struct Todo: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

extension Todo {
    
    static func placeholder(_ id: Int) -> Todo {
        
        Todo(userId: 0, id: id, title: "Todo Title", completed: .random())
    }
}

