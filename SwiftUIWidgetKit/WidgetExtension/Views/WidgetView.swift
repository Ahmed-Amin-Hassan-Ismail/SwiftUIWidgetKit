//
//  WidgetView.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 26/07/2023.
//

import SwiftUI

struct WidgetView: View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) private var widgetFamily

    var body: some View {
        
        switch widgetFamily {
        case .systemMedium:
            MediumWidgetView(entry: entry)
        case .systemLarge:
            LargeWidgetView(entry: entry)
        default:
            Text("Not Implemented ! ")
        }
    }
}
