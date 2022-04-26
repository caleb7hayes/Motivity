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
                        
                        Text(authRouter.userName)
                            .font(.system(size:30))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 0)
                        
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
                
                
                /*
                 Text("Event: " + authRouter.events)
                 Text("Start: " + authRouter.start)
                 Text("Duration: " + String(authRouter.dur))
                 */
                
            }//.onAppear(){
            // authRouter.displayPosts()
            
            DailyBreakdownEventView(authRouter: AuthRouter(), Event: "Morning Brunch", StartTime: "5:00", EventDuration: 1, eventType: "Rest")
                .position(x: 210.0, y: 680.0)
            
            DailyBreakdownEventView(authRouter: AuthRouter(), Event: "Work Meeting", StartTime: "5:00", EventDuration: 1, eventType: "Work")
                .position(x: 210.0, y: 760.0)
            
            DailyBreakdownEventView(authRouter: AuthRouter(), Event: "Workout w/ CJ", StartTime: "5:00", EventDuration: 1, eventType: "Health")
                .position(x: 210.0, y: 840.0)
            
            
            
        }
        
        
        
        //Bottom of ZStack, add events here
        
        
        
        
        
        
        
    }
    
    
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter(),  authRouter: AuthRouter())
    }
}



