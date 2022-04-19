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
    @Published var postData = [String]()

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
        databaseHandle = self.ref.child("Users").child(userID!).observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            
            if let actualPost = post {
                if !self.postData.contains(actualPost) {
                    self.postData.append(actualPost)
                }
            }
        })
    }
    
    func createPost(name: String, start: String, dur: String, loc: String){
        self.ref.child("Users").child(userID!).child("Event").child(name).setValue(["start": start, "dur": dur, "loc": loc])
    }
}
