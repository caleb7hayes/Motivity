//
//  MotherView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/31/22.
//

import SwiftUI

struct MotherView: View {
    

    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        
        // Switch statement for the ObservableObject. The
        // ObservableObject is what the motherview looks at
        // to find out what page to display. All pages are
        // read into the ObservableObject
        
        switch viewRouter.currentPage {
            
        case .welcomePage:
            WelcomePage(viewRouter: viewRouter)
            
        case .loginPage:
            LoginPage(viewRouter: viewRouter)
                .transition(.opacity)
                .transition(.scale)
            
        case .existingUserPage:
            
            ExisitingUserPage(viewRouter: viewRouter)
            
            
        case .calendarPage:
            
            CalendarView(viewRouter: viewRouter)
          
            
        case .settingsPage:
            SettingsPage(viewRouter: viewRouter)
            
               
        case .userProfilePage:
            UserProfilePage(viewRouter: viewRouter)
            
            
        case .addTaskPage:
            AddTaskPage(viewRouter: viewRouter)
            
            
        case .editTaskPage:
            EditTaskPage(viewRouter: viewRouter)
    
        }
        
    }
}
        

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
