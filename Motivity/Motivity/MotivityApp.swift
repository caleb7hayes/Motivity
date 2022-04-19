//
//  MotivityApp.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/10/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

@main
struct MotivityApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var viewRouter = ViewRouter()
    @StateObject var authRouter = AuthRouter()

    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: ViewRouter(), authRouter: AuthRouter())
        
        }
    }
}
