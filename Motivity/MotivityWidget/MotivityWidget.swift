//
//  MotivityWidget.swift
//  MotivityWidget
//
//  Created by Christian Hess on 3/31/22.
//

import WidgetKit
import SwiftUI
import Intents
import Foundation
import Firebase



struct Provider: TimelineProvider {
    
    //    var eventData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        print("updating timeline")
        var entries: [SimpleEntry] = []

        let currentDate = Date()
//        let midnight = Calendar.current.startOfDay(for: currentDate)
//        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)
//        for offset in 0 ..< 60 * 24{
        let entryDate = SimpleEntry(date: currentDate)
        entries.append(entryDate)
//        }
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date())!
        let timeline = Timeline(entries: entries, policy: .after(refreshDate))
        completion(timeline)
        }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MotivityWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family: WidgetFamily
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            MotivityWidgetSmallView(entry: Provider.Entry.init(date: Date()))
        case .systemMedium:
            MotivityWidgetMediumView(entry: Provider.Entry.init(date: Date()))
        case .systemLarge:
            MotivityWidgetLargeView(entry: Provider.Entry.init(date: Date()))
        case .systemExtraLarge:
            MotivityWidgetExtraLargeView()
        @unknown default:
            EmptyView()
        }
    }
}


// struct for functionality of small widget
struct MotivityWidgetSmallView : View {
    var entry: Provider.Entry
    
    @State var currentData: String?
    @State var currentStarts: String?
    
    var body: some View {
        ZStack {
            Image("Motivity Login Background").ignoresSafeArea()
                .padding(.leading, 20)
            VStack (alignment: .leading) {
                HStack{
                    Text(currentData ?? "Please Log In")
                        .foregroundColor(Color.white)
                        .onAppear {
                            currentData = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "small")
                        }
                    Text(currentStarts ?? "")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .onAppear{
                            currentStarts = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "smallTimes")
                        }
                }
            }
        }
    }
}

// struct for functionality of medium widget
struct MotivityWidgetMediumView : View {
    var entry: Provider.Entry
    
    @State var currentData: String?
    @State var currentStarts: String?
    
    var body: some View {
        ZStack {
            Image("Motivity Login Background").ignoresSafeArea()
                .padding(.leading, 20)
            VStack (alignment: .leading) {
                HStack{
                    Text(currentData ?? "Please Log In")
                        .foregroundColor(Color.white)
                        .onAppear {
                            currentData = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "medium")
                        }
                    Text(currentStarts ?? "")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .onAppear{
                            currentStarts = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "mediumTimes")
                        }
                }
                Text("You can do it!")
                    .foregroundColor(Color.white)
            }
            .padding(.trailing, 175)
        }
    }
}
// struct for functionality of large widget
struct MotivityWidgetLargeView : View {
    var entry: Provider.Entry
    
    @State var currentData: String?
    @State var currentStarts: String?
    
    var body: some View {
        ZStack {
            Image("Motivity Login Background").ignoresSafeArea()
                .padding(.leading, 20)
            VStack (alignment: .leading) {
                HStack{
                    Text(currentData ?? "Please Log In")
                        .foregroundColor(Color.white)
                        .onAppear {
                            currentData = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "large")
                        }
                    Text(currentStarts ?? "")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .onAppear{
                            currentStarts = UserDefaults(suiteName: "group.motivity.widget")?.string(forKey: "largeTimes")
                        }
                }
                Text("You can do it!")
                    .foregroundColor(Color.white)
            }
            .padding(.trailing, 175)
        }
    }
}

// struct for functionality of extra large widget
struct MotivityWidgetExtraLargeView : View {
    var body: some View {
        Text("place holder for extra large widget family")
    }
}


@main
struct MotivityWidget: Widget {
    
    let kind: String = "MotivityWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MotivityWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Motivity")
        .description("Motivity Widgets")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct MotivityWidget_Previews: PreviewProvider {
    static var previews: some View {
        MotivityWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

