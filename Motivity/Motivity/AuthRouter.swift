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
    
    @Published var userName = ""
    @Published var signedIn = false
    @Published var start = ""
    @Published var dur = 0
    @Published var events = ""

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
           self?.userName = email
       }
    }

    func signUp(email: String, password: String){
       Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
           guard result != nil, error == nil else {
               return
           }
           self?.signedIn = true
           self?.userID = Auth.auth().currentUser?.uid
           self?.userName = email
       }
    }

    func signOut(){
       try? auth.signOut()
       self.signedIn = false
    }
    
    
    func displayPosts(){
        databaseHandle = self.ref.child("Users").child("CJ").child("Events").observe(.value, with: { (snapshot) in
            let data = snapshot.value as! [String: [String: Any]]
            self.start = data["Gym"]!["Start"] as! String
            self.dur = data["Gym"]!["Duration"] as! Int
            self.events = "Gym"
        })
    }
    
    func createEvent(name: String, start: String, dur: String){
        self.ref.child("Users").child(userID!).child("Events").child(name).setValue(["Start": start, "Durration": dur])
    }
    
    func createGoal(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Goals").child(name).setValue(["Desc": desc])
    }
    
    func createTask(name: String, desc: String){
        self.ref.child("Users").child(userID!).child("Tasks").child(name).setValue(["Desc": desc])
    }
}
