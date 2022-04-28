//
//  CalendarView4.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/26/22.
//

import SwiftUI

struct CalendarView4: View {
    
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    
    var body: some View {
        
        ZStack{
            
            Image("ChangeView3").ignoresSafeArea()
            
            
            Button(action: {
                    viewRouter.currentPage = .changeView3
            
                
                
            }) {
            Image("REFORMAT BUTTON")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 39, height: 39)
                .position(x: 80, y: 528)
            }
            
        }
    
    }
}

struct CalendarView4_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView4(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
