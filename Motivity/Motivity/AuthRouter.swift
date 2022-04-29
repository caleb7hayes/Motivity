//
//  AuthRouter.swift
//  Motivity
//
//  Created by Tyler on 4/18/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase
import WidgetKit

class AuthRouter: ObservableObject {
    let auth = Auth.auth()
    var userID = Auth.auth().currentUser?.uid
    var ref: DatabaseReference = Database.database().reference()
    var databaseHandle: DatabaseHandle?
    
    @Published var signedIn = false
    @Published var noData = false
    @Published var events : [String] = []
    @Published var goals : [String] = []
    @Published var tasks : [String] = []
    
    @Published var categorey1: Bool = false
    @Published var categorey2: Bool = false
    @Published var categorey3: Bool = false
    @Published var categorey4: Bool = false
    @Published var categorey5: Bool = false
    @Published var categorey6: Bool = false

    var isSignedIn: Bool {
       return auth.currentUser != nil
    }

    func signIn(email: String, password: String){
       auth.signIn(withEmail: email, password: password) {[weak self] result, error in
           guard result != nil, error == nil else {
               return
           }
           self?.signedIn = true
           self?.userID = Auth.auth().currentUser?.uid
           
       }
    }

    func signUp(email: String, password: String){
       Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
           guard result != nil, error == nil else {
               return
           }
           self?.signedIn = true
           self?.userID = Auth.auth().currentUser?.uid
       }
    }

    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    
    
    func displayEvent(){
        databaseHandle = self.ref.child("Users").child(userID!).child("Events").observe(.value, with: { (snapshot) in
            if let database = snapshot.value as? [String: [String: Any]] {
                for e in database{
                    if !self.events.contains(e.key) {
                        self.events.append(e.key)
                        self.events.append(e.value["Duration"] as! String)
                        self.events.append(e.value["EventType"] as! String)
                        self.events.append(e.value["StartDate"] as! String)
                        self.events.append(e.value["StartTime"] as! String)
                    }
                }
            } else {
                self.noData = true
            }
        })
        sendSmallWidgetData()
        sendMediumWidgetData()
        sendLargeWidgetData()
    }
    
    func displayGoal(){
        databaseHandle = self.ref.child("Users").child(userID!).child("Goals").observe(.value, with: { (snapshot) in
            if let database = snapshot.value as? [String: [String: Any]] {
                for e in database{
                    if !self.goals.contains(e.key){
                        self.goals.append(e.key)
                        self.goals.append(e.value["Desc"] as! String)
                    }
                    
                }
            }
        
        })
    }
    
    func displayTask(){
        databaseHandle = self.ref.child("Users").child(userID!).child("Tasks").observe(.value, with: { (snapshot) in
            if let database = snapshot.value as? [String: [String: Any]] {
                for e in database{
                    if !self.tasks.contains(e.key){
                        self.tasks.append(e.key)
                        self.tasks.append(e.value["Desc"] as! String)
                    }
                }
            }
        
        })
    }
    
    func createEvent(name: String, startDate: String, startTime: String, dur: String, eventType: String){
            self.ref.child("Users").child(userID!).child("Events").child(name).setValue(["StartDate": startDate, "StartTime": startTime, "Duration": dur, "EventType": eventType])
        }
    
    func createGoal(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Goals").child(name).setValue(["Desc": desc])
    }
    
    func createTask(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Tasks").child(name).setValue(["Desc": desc])
    }
    
    func getDay() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        let day = df.string(from: date)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let dayOfMonth = components.day
        let monthDay = String(dayOfMonth!)
        
        var finalString = ""
        
        if monthDay == "1"{
            finalString += day + " the " + monthDay + "st"
        }
        else if monthDay == "2"{
            finalString += day + " the " + monthDay + "nd"
        }
        else if monthDay == "3"{
            finalString += day + " the " + monthDay + "rd"
        }
        else{
            finalString += day + " the " + monthDay + "th"
        }
        
        return finalString
    }

    func createIdea(){
        if categorey1 && categorey2 {
        self.ref.child("Users").child(userID!).child("Events").child("Read").setValue(["StartDate": "30", "StartTime": "8:00", "Duration": "1", "EventType": "Rest"])
        } else if categorey1 && categorey3 {
        self.ref.child("Users").child(userID!).child("Events").child("Massage").setValue(["StartDate": "29", "StartTime": "13:00", "Duration": "1", "EventType": "Health"])
        } else if categorey1 && categorey6{
            self.ref.child("Users").child(userID!).child("Events").child("Netflix").setValue(["StartDate": "29", "StartTime": "20:00", "Duration": "2", "EventType": "Rest"])
        } else if categorey3 && categorey4 {
            self.ref.child("Users").child(userID!).child("Events").child("Community Run").setValue(["StartDate": "29", "StartTime": "8:00", "Duration": "1", "EventType": "Health"])
        } else if categorey5 {
            self.ref.child("Users").child(userID!).child("Events").child("Go to Church").setValue(["StartDate": "29", "StartTime": "9:00", "Duration": "2", "EventType": "Rest"])
        }
        
    }
    
    func getCat () -> String {
        if categorey1{
            return "During your free\n time today, find\ntime to rest!\nYou deserve it🧘"
        }
        else if categorey2 {
            return "In your free time \ntoday, let's do some \nself-relfection😌"
        }
        else if categorey3 {
            return "Looks like you\n have time to go the\n gym today!💪"
        }
        else if categorey4{
            return "Take a minute\n get out in the \ncommunity today!"
        }
        else if categorey5{
            return "Find some time \nto read scripture or\n pray today🙏"
        }
        else if categorey6{
            return "Lets find time to \nread a book today!📚"
        }
        else{
            return ""
        }
    }
    
    
    //function to send data to small widget
    func sendSmallWidgetData () -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        let seq = stride(from: 0, to: self.events.count, by: 5)
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+4]
            if currentEvent.count > 12{
                let index = currentEvent.index(currentEvent.startIndex, offsetBy: 11)
                let subString = currentEvent[..<index]
                eventData += subString + "..."
                eventStarts += currentEventStart
            }
            else{
                eventData += currentEvent
                eventStarts += currentEventStart
            }
            eventData += "\n"
            eventStarts += "\n"
        }
        let dayData = getDay()
        UserDefaults(suiteName: "group.motivity.widget")!.set(dayData, forKey: "smallDay")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "small")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "smallTimes")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    //function to send data to medium widget
    func sendMediumWidgetData() -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        
        let seq = stride(from: 0, to: self.events.count, by: 5)
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+4]
            if currentEvent.count > 9{
                let index = currentEvent.index(currentEvent.startIndex, offsetBy: 11)
                let subString = currentEvent[..<index]
                eventData += subString + "..."
                eventStarts += currentEventStart
            }
            else{
                eventData += currentEvent
                eventStarts += currentEventStart
            }
        eventData += "\n"
        eventStarts += "\n"
        }
        let dayData = getDay()
        let cat = getCat()
        if cat != ""{
            UserDefaults(suiteName: "group.motivity.widget")!.set(cat, forKey: "mediumCat")
        }
        UserDefaults(suiteName: "group.motivity.widget")!.set(dayData, forKey: "mediumDay")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "medium")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "mediumTimes")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    
    // function to send information to largeWidget
    func sendLargeWidgetData() -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        
        let seq = stride(from: 0, to: self.events.count, by: 5)
        
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+4]
            eventData += currentEvent + "\n"
            eventStarts += currentEventStart + "\n"
            
        }
        let dayData = getDay()
        UserDefaults(suiteName: "group.motivity.widget")!.set(dayData, forKey: "largeDay")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "large")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "largeTimes")
        WidgetCenter.shared.reloadAllTimelines()
    }
}
