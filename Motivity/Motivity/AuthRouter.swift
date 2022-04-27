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
                        self.events.append(e.value["Start"] as! String)
                        self.events.append(e.value["Duration"] as! String)
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
    
    func createEvent(name: String, start: String, dur: String){
        self.ref.child("Users").child(userID!).child("Events").child(name).setValue(["Start": start, "Duration": dur])
    }
    
    func createGoal(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Goals").child(name).setValue(["Desc": desc])
    }
    
    func createTask(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Tasks").child(name).setValue(["Desc": desc])
    }
    
    
    //function to send data to small widget
    func sendSmallWidgetData () -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        
        let seq = stride(from: 0, to: self.events.count, by: 3)
        print(self.events.count)
        
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+1]
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
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "small")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "smallTimes")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    //function to send data to medium widget
    func sendMediumWidgetData() -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        
        let seq = stride(from: 0, to: self.events.count, by: 3)
        print(self.events.count)
        
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+1]
            eventData += currentEvent + "\n"
            eventStarts += currentEventStart + "\n"
            
        }
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "medium")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "mediumTimes")
        WidgetCenter.shared.reloadAllTimelines()    }
    
    
    // function to send information to largeWidget
    func sendLargeWidgetData() -> Void {
        var eventData : String = ""
        var eventStarts : String = ""
        
        let seq = stride(from: 0, to: self.events.count, by: 3)
        print(self.events.count)
        
        for i in seq{
            let currentEvent = self.events[i]
            let currentEventStart = self.events[i+1]
            eventData += currentEvent + "\n"
            eventStarts += currentEventStart + "\n"
            
        }
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventData, forKey: "large")
        UserDefaults(suiteName: "group.motivity.widget")!.set(eventStarts, forKey: "largeTimes")
        WidgetCenter.shared.reloadAllTimelines()
    }
}
