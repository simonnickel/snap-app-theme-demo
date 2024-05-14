//
//  ThemeWidget.swift
//  ThemeWidget
//
//  Created by Simon Nickel on 14.05.24.
//

import WidgetKit
import SwiftUI
import SnapTheme

struct ThemeWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

struct ThemeWidget: Widget {
    let kind: String = "ThemeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
			
			ThemeWidgetEntryView(entry: entry)
				.theme(containerBackground: .interactive, placement: .widget)
			
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemMedium) {
    ThemeWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now+9999, emoji: "🤩")
}
