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

class AuthRouter: ObservableObject {
    let auth = Auth.auth()
    var userID = Auth.auth().currentUser?.uid
    var ref: DatabaseReference = Database.database().reference()
    var databaseHandle: DatabaseHandle?
    
    @Published var signedIn = false
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
                        self.events.append(e.value["Duration"] as! String)
                        self.events.append(e.value["EventType"] as! String)
                        self.events.append(e.value["StartDate"] as! String)
                        self.events.append(e.value["StartTime"] as! String)
                        //self.events.append(e.value["Duration"] as! String)
                        //self.events.append(e.value["Datetime"] as! String)
                    }
                }
            }
        
        })

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
        print(startTime)
        self.ref.child("Users").child(userID!).child("Events").child(name).setValue(["StartDate": startDate, "StartTime": startTime, "Duration": dur, "EventType": eventType])
        print(startTime)
    }
    
    func createGoal(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Goals").child(name).setValue(["Desc": desc])
    }
    
    func createTask(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Tasks").child(name).setValue(["Desc": desc])
    }

    
}
