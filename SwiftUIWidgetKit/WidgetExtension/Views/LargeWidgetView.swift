//
//  LargeWidgetView.swift
//  WidgetExtensionExtension
//
//  Created by Ahmed Amin on 26/07/2023.
//

import SwiftUI

struct LargeWidgetView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
   
        
        VStack {
            
            HStack {
                Text("My Todo")
                
                Text(Date(), style: .date )
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(8)
            .background(Color.blue)
            .clipped()
            .shadow(radius: 5)
            
            
            ForEach(entry.todos) { todo in
                Link(destination: URL(string: "myapp://todo/\(todo.id)")!) {
                    HStack {
                        
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay (
                                
                                Image(systemName: todo.completed ? "checkmark" : "")
                                )
                        
                        Text(todo.title)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
            
            Spacer()
        }
        
    }
}
