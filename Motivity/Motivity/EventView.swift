//
//  EventView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//
import SwiftUI

struct EventView: View {
    
    var eventName: String
    var startTime: String
    //var endTime: String
    //var eventType: String
    
    //var eventColor: String
    
    //logict to set event color based on eventType
        
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(eventName: "devops", startTime: "11:56")
    }
}


