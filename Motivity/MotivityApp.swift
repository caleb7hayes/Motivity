//
//  MotivityApp.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/10/22.
//

import SwiftUI

@main
struct MotivityApp: App {
    
    
    @StateObject var viewRouter = ViewRouter()
    

    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: ViewRouter())
        }
    }
}
