//
//  CalendarView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//
import SwiftUI
import Foundation



class CalendarViewController: UIViewController, ObservableObject{
    
    func getCurrentWeek() -> [String]{
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!

        let formatter = DateFormatter()
        formatter.dateFormat = "d"

        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }

        return days.map{ formatter.string(from: $0) }
    }
    

}


struct CalendarView: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    
    @ObservedObject var appView = CalendarViewController()
    
    @EnvironmentObject var viewModel: CalendarViewController
        
    let calendar = Calendar.current
    
    var data = ["Sun.", "Mon.", "Tues", "Wed.", "Thur.", "Fri.", "Sat."]
    var dates = ["10", "11", "12", "13", "14", "15", "16",]
    var x = [10, 11, 12, 13, 14, 15, 16]
   
    let date = Date()
    

    
    
    
    var body: some View {
        
         
        
        
        ZStack{
            
            Image("Calendar Demo View").ignoresSafeArea()
            
            
            
            
            VStack{
                
                //Settings and profile section
                HStack{
                    
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .settingsPage
    
                    }){
                        
                        Image("GEAR ICON")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .padding(.trailing, 140)
                            .padding(.top,20)
                            
                        
                    }
                    

                    
                        
                   
                    Button(action:{
                        
                        viewRouter.currentPage = .userProfilePage
    
                    }){
                        
                        Image("USER PROFILE ICON")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .padding(.leading, 140)
                            .padding(.top,20)
                            
                        
                    }
                        
                    
                   
                    
                }
                
                
                
                
                //User's (name) schedule and date
                
                
                HStack{
                    
                    VStack{
                        
                        Text(date, style: .date)
                            .font(.system(size:16))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        
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
                    
                    
                    let y = appView.getCurrentWeek()
                    
                    ForEach(y, id: \.self){ item in
                        Spacer()
                        Text(item)
                            .font(.system(size:16))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            
                        Spacer()
                        
                        
                    }
                    
                    
                    
                    
                    
                }.padding(.bottom, 260)
                
                //Regformat and sugesstion button
                
                HStack{
                    
                    Spacer()
                    Image("REFORMAT BUTTON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    
                    Spacer()
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .addEventPage
    
                    }){
                        
                        Image("ADD TASK")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                        
                    }
                    
                    
                        
                    Spacer()
                    
                    Image("SUGGESTION BUTTON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    Spacer()
                    
                }
                .padding(.top,-10)
                .padding(.bottom,70)
                //.padding(.bottom,170)
                
                //Daily Breakdown
                
                
                Text("")
                
                  
                    .font(.system(size:23))
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 200)
                    .padding(.bottom, 180)
                    .padding(.top,10)
                
                
                
                    
                
                
            .onAppear{
                authRouter.displayEvent()
            }
                   // .padding(.bottom, 160)
                
                
            }
            
            Text("Daily Breakdown")
                .font(.system(size:23))
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .position(x: 120, y: 610)
            
            
            
            let event = authRouter.events
            
            let eventSize = event.count / 5
    
            
            if eventSize == 0 {
      
            }
            
            
            else if eventSize == 1 {
                
                
                //----------EVENT ONE------------
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                    .position(x: 210.0, y: 680.0)
                
                MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[3], Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                
                
                
                
            }
            
            else if eventSize == 2 {
                
                
                //----------EVENT ONE------------
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                    .position(x: 210.0, y: 680.0)
                
                MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[3], Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                
                //----------EVENT TWO------------
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
                    .position(x: 210.0, y: 760.0)
                
                MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[8], Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
          
            }
            
             else {
                
                //----------EVENT ONE------------
                 
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                    .position(x: 210.0, y: 680)
                 
                 
                 MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[3], Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                
                 
                 //----------EVENT TWO------------
                 
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
                    .position(x: 210.0, y: 760)
                 
                 
                 MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[8], Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
                
                 
                 //----------EVENT THREE------------
                 
                
                DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[10], StartTime: event[14], EventDuration: Int(event[11]) ?? 1, eventType: event[12])
                    .position(x: 210.0, y: 840)
                 
                 
                 MainCalendarEventView(authRouter: AuthRouter(), eventDate: event[13], Event: event[10], StartTime: event[14], EventDuration: Int(event[11]) ?? 1, eventType: event[12])
            
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
