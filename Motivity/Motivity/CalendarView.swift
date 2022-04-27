//
//  CalendarView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//
import SwiftUI

struct CalendarView: View {
    
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    
    
    var data = ["Sun.", "Mon.", "Tues", "Wed.", "Thur.", "Fri.", "Sat`."]
    var dates = ["20", "21", "22", "23", "24", "25", "26",]
    
    
    
    
    
    
    
    var body: some View {
        
        ZStack{
            
            Image("Calendar Demo View").ignoresSafeArea()
            
            
            
            
            VStack{
                
                //Settings and profile section
                HStack{
                    
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .userProfilePage
                        
                    }){
                        
                        Image("GEAR ICON")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .padding(.trailing, 140)
                            .padding(.top,00)
                        
                        
                    }
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .userProfilePage
                        
                    }){
                        
                        Image("USER PROFILE ICON")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .padding(.leading, 140)
                            .padding(.top,00)
                        
                        
                    }
                    
                }
                
                
                
                
                //User's (name) schedule and date
                
                
                HStack{
                    
                    VStack{
                        
                        
                        
                        Text("April 20th - 26th")
                            .font(.system(size:16))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.top,0)
                        
                    }
                }
                
                //Calendar Dates
                
                HStack{
                    ForEach(data, id: \.self){ item in
                        Spacer()
                        Text(item)
                            .font(.system(size:18))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
                .padding(.top, 1.0)
                
                
                
                
                HStack(){
                    ForEach(dates, id: \.self){ item in
                        Spacer()
                        Text(item)
                            .font(.system(size:16))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }.padding(.bottom, 380)
                
                //Regformat and sugesstion button
                
                HStack{
                    
                    Spacer()
                    Image("REFORMAT BUTTON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    
                    Spacer()
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .addTaskPage
                        
                    }){
                        
                        Image("ADD TASK")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    Image("SUGGESTION BUTTON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    Spacer()
                    
                }
                .padding(.top,-120)
                .padding(.bottom,0)
                
                
                //Daily Breakdown
                
                
                Text("Daily Breakdown")
                
                    .font(.system(size:23))
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 200)
                    .padding(.bottom, 220)
                    .padding(.top,0)
                
                
                
                
            }.onAppear(){
                
                authRouter.displayEvent()
                
            }
            
            
            
            
            let event = authRouter.events
            
            let eventSize = event.count / 3
    
            
            if eventSize == 0 {
                
                
                
                
            }
            
            
            else if eventSize == 1 {
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[2], EventDuration: Int(event[1]) ?? 0, eventType: "Rest")
                    .position(x: 210.0, y: 680.0)
                
                
                
            }
            
            else if eventSize == 2 {
                
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[2], EventDuration: Int(event[1]) ?? 1, eventType: "Rest")
                    .position(x: 210.0, y: 680.0)
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[3], StartTime: event[5], EventDuration: Int(event[4]) ?? 1, eventType: "Work")
                    .position(x: 210.0, y: 760.0)
                
                
                
                
            }
            
             else if eventSize == 3 {
                
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[2], EventDuration: Int(event[1]) ?? 1, eventType: "Rest")
                    .position(x: 210.0, y: 680.0)
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[3], StartTime: event[5], EventDuration: Int(event[4]) ?? 1, eventType: "Work")
                    .position(x: 210.0, y: 760.0)
                
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[6], StartTime: event[8], EventDuration: Int(event[7]) ?? 1, eventType: "Health")
                    .position(x: 210.0, y: 840.0)
            
            }
             
          
        }
        
        //Bottom of ZStack, add events here
        
    }
   
}






struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter(),  authRouter: AuthRouter())
    }
}



