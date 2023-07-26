//
//  WidgetExtension.swift
//  WidgetExtension
//
//  Created by Ahmed Amin on 26/07/2023.
//

import WidgetKit
import SwiftUI


struct WidgetExtension: Widget {
    let kind: String = "WidgetExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Todo Widget")
        .description("View your latest todo(s) .")
    }
}

struct WidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0)]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
