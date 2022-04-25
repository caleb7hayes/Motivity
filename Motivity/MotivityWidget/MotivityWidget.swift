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



struct Provider: IntentTimelineProvider {
    
    @AppStorage("events", store: UserDefaults(suiteName: "Team-Motivity.Motivity"))
    var eventData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct MotivityWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family: WidgetFamily
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            MotivityWidgetSmallView(entry: Provider.Entry.init(date: Date(), configuration: ConfigurationIntent()))
        case .systemMedium:
            MotivityWidgetMediumView()
        case .systemLarge:
            MotivityWidgetLargeView()
        case .systemExtraLarge:
            MotivityWidgetExtraLargeView()
        @unknown default:
            EmptyView()
        }
    }
}

func getDates() -> String {
//    print("IN GET DATES")
////    let events = UserDefaults.group?.object(forKey: "EventsKey")
//    var events : [String:[String:Any]] = [:]
////    var allEvents = String()
    let router = AuthRouter()
    let events = router.getEvents()

//    guard let dur = events["School"]["Duration"] as? String else {
//        return "No Data"
//    }
//    for key in events.keys {
//        allEvents += key
//    }
//    for key in events.keys {
//        allEvents += key
//
//    }
//
//    return allEvents
    return events
}

// struct for functionality of small widget
struct MotivityWidgetSmallView : View {
    let events = UserDefaults.group?.object(forKey: "EventsKey")
    var eventData = getDates()
    var entry: Provider.Entry
    var body: some View {
        
        ZStack {
            Image("Motivity Login Background").ignoresSafeArea()
            Text(eventData)
            Text(entry.date, style: .timer)
                .multilineTextAlignment(.center)
            
//            Text(events)
        }

        
//        ZStack{
//
//            //background image for all pages throughout Motvitiy
//
//            //vertical stack for top text
//            VStack(alignment: .leading){
//
//
//
////                    .font(.body)
////                    .fontWeight(.bold)
////                    .foregroundColor(Color.white)
////                    .frame(maxWidth: .infinity, alignment: .leading)
////                    .padding(.leading,70)
//            }
//        }
    }
}

// struct for functionality of medium widget
struct MotivityWidgetMediumView : View {
    var body: some View {
        
        ZStack{
            
            //background image for all pages throughout Motvitiy
            Image("Motivity Login Background").ignoresSafeArea()
            
            //vertical stack for top text
            VStack(alignment: .leading){
                
                Text("Medium Widget")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,49)
            }
        }
    }
}
// struct for functionality of large widget
struct MotivityWidgetLargeView : View {

    var body: some View {
        
        ZStack{
            
            //background image for all pages throughout Motvitiy
            Image("Motivity Login Background").ignoresSafeArea()
            
            //vertical stack for top text
            VStack(alignment: .leading){
                Text("Large Widget")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,49)
            }
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
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MotivityWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Motivity")
        .description("Motivity Widgets")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct MotivityWidget_Previews: PreviewProvider {
    static var previews: some View {
        MotivityWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

