//
//  ViewRouter.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/31/22.
//

import SwiftUI


//The whole prupose for the ViewRouter is to keep track on what page we are on and what data needs to assigned to it.


class ViewRouter: ObservableObject{
    
    
    // @Published propertey wrapper works just like @State (State just makes mutable data within it's scope)
    // When the data of the @Published gets updated, all views get updated as well,
    
    
    @Published var currentPage : Page = .welcomePage
    
    
    
    
}
