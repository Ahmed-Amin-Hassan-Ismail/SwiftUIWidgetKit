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
            
            
            ForEach(0..<5, id: \.self) { _ in
                Link(destination: URL(string: "myapp://todo/1")!) {
                    HStack {
                        
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image(systemName: "checkmark")
                            )
                        
                        Text("Todo Title")
                        
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
