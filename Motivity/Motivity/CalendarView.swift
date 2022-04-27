//
//  CalendarView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//
import SwiftUI
import Foundation

var selectedDate = Date()
var totalSquares = [Date]()

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
    
    func yep() -> [String]{
        return ["1", "2", "3", "4", "5", "6", "7"]
    }
    

    //var totalSquares = [Date]()
    let calendar = Calendar.current
    
    
    func dayOfMonth2(date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    
    
    
    
    func addDays(date: Date, days: Int) -> Date
    {
        return calendar.date(byAdding: .day, value: days, to: date)!
        
    }
    
    
    
    
    func sundayForDate(date: Date) -> Date
    {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo)
        {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if(currentWeekDay == 1)
            {
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
    }
    
    
    
    
    func setWeekView() -> [Date]//[String]
    {
        
        var current = self.sundayForDate(date: selectedDate)
        let nextSunday = self.addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            
            current = self.addDays(date: current, days: 1)
        }
        
        //let strings:[String] = totalSquares as! [String]
        //return strings
        
        return totalSquares
        
        
      
    }
    
    
    
    func addDays2(date: Date, days: Int) -> Date
    {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    
  /*  func dayOfMonth() -> [String]
    {
        //let components = calendar.dateComponents([.day], from: date)
        //return components.day!
        let date = Date()
        let currentWeekDay = calendar.dateComponents([.weekday], from: date).weekday
        let components = calendar.dateComponents([.day], from: date)
        var strings = [String]()
        
        //calendar.date(byAdding: .day, value: days, //to: date)!
        
        if(currentWeekDay == 1)
        {
            strings = [String(components.day!),
                       String(components.day! + 1),
                       String(components.day! + 2),
                       String(components.day! + 3),
                       String(components.day! + 4),
                       String(components.day! + 5),
                       String(components.day! + 6)]
            
        }
        else if(currentWeekDay == 4)
        {
            /*strings = [String(components.day! - 1),
                       String(components.day!),
                       String(components.day! + 1),
                       String(components.day! + 2),
                       String(components.day! + 3),
                       String(components.day! + 4),
                       String(components.day! + 14)]*/
            
            return calendar.dateComponents(([.day], from: date) byAdding: .day, value: 1 to: date)!
            
        }
        
        
       /* return [String(components.day! - 1),
                String(components.day!),
                String(components.day! + 1),
                String(components.day! + 2),
                String(components.day! + 3),
                String(components.day! + 4),
                String(components.day! + 15)]*/
        //return strings
        
    }*/
    

    
  /*  public func doSomething() -> [String]{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        
        let go = [formatter.string(from: date), formatter.string(from: date), formatter.string(from: date), formatter.string(from: date), formatter.string(from: date), formatter.string(from: date), formatter.string(from: date)]
        
        return go
    }*/
    

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
            
            Image("CALENDAR BACKGROUND").ignoresSafeArea()
            
            
            
            
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
                .padding(.top,50)
                .padding(.bottom,70)
                //.padding(.bottom,170)
                
                //Daily Breakdown
                
                
                Text("Daily Breakdown")
                
                    
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
                
                
                
                
                let event = authRouter.events
                
                let eventSize = event.count / 3
        
                
                if eventSize == 0 {
                    
                    
                    
                    
                }
                
                
                else if eventSize == 1 {
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                        .position(x: 210.0, y: 680.0)
                    
                    
                    
                    
                }
                
                else if eventSize == 2 {
                    
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                        .position(x: 210.0, y: 680.0)
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
                        .position(x: 210.0, y: 760.0)
                    
                    
                    
                    
                    
                }
                
                 else if eventSize == 3 {
                    
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[0], StartTime: event[4], EventDuration: Int(event[1]) ?? 1, eventType: event[2])
                        .position(x: 210.0, y: 680.0)
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[5], StartTime: event[9], EventDuration: Int(event[6]) ?? 1, eventType: event[7])
                        .position(x: 210.0, y: 760.0)
                    
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: event[10], StartTime: event[14], EventDuration: Int(event[11]) ?? 1, eventType: event[12])
                        .position(x: 210.0, y: 840.0)
                
                }
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
