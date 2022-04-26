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
    
//    @AppStorage("events", store: UserDefaults(suiteName: "Team-Motivity.Motivity"))
//    var eventData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        print("updating timeline")
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

// struct for functionality of small widget
struct MotivityWidgetSmallView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            Image("Motivity Login Background").ignoresSafeArea()
                .padding(.leading, 20)
//            if eventData.signedIn{
//                Text("Signed in")
//            }
//            else{
//                Text("Not Signed in \n Click here to sign in!")
//                    .foregroundColor(Color.white)
//                    .padding(.leading, 5)
//            }
            
            Text(entry.date, style: .timer).ignoresSafeArea()

        }
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

