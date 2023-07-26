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
                
                VStack(alignment: .leading) {
                    
                    Text("Todo Title")
                        .font(.headline)
                    
                    Text("Complete")
                        .font(.subheadline)
                }
             
                Spacer()
                
            }
            .padding()
            
        } label: {
            Label("My Todo", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/1"))
    }
}
