//
//  MediumWidgetView.swift
//  WidgetExtensionExtension
//
//  Created by Ahmed Amin on 26/07/2023.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
        
        GroupBox {
            
            HStack {
                
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.secondary)
                
                
                Divider()
                
                if let todo = entry.todos.first {
                    VStack(alignment: .leading) {
                        
                        Text(todo.title)
                            .font(.headline)
                        
                        Text(todo.completed ? "Complete" : "Open")
                            .font(.subheadline)
                            .foregroundColor(todo.completed ? .green : .red)
                    }
                }
             
                Spacer()
                
            }
            .padding()
            
        } label: {
            Label("My Todo", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/\(entry.todos.first?.id ?? 0)"))
    }
}
