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
    @Published var events : [String:[String:Any]] = [:]

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
                self.events = database
                for e in self.events{
                    print(e.key)
                    print(e.value["Start"] as! String)
                    print(e.value["Duration"] as! String)
                }
            }
        
        })
    }
    
    func displayGoal(){
        databaseHandle = self.ref.child("Users").child(userID!).child("Goals").observe(.value, with: { (snapshot) in
            if let database = snapshot.value as? [String: [String: Any]] {
                self.events = database
                for e in self.events{
                    print(e.key)
                    print(e.value["Desc"] as! String)
                }
            }
        
        })
    }
    
    func displayTask(){
        databaseHandle = self.ref.child("Users").child(userID!).child("Tasks").observe(.value, with: { (snapshot) in
            if let database = snapshot.value as? [String: [String: Any]] {
                self.events = database
                for e in self.events{
                    print(e.key)
                    print(e.value["Desc"] as! String)
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
}
