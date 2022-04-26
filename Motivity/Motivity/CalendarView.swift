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

//let date = Date()
//let calendar = Calendar.current
//let components = calendar.dateComponents([.day], from: date)
//return components.day!

//var week = [components.day!]

/*var selectedDate = Date()

class CalendarCell: UICollectionViewCell
{
    var dayOfMonth: UILabel!
}

class CalendarViewController: ObservableObject{
    
    //@Published var selectedDate = Date()
    //@Published var totalSquares = [Date]()
    var totalSquares = [Date]()
    
    /*override func viewDidLoad()
    {
        super.viewDidLoad()
        //setCellsView()
        setWeekView()
        
   }*/
    
    let calendar = Calendar.current
    
    
    
    func dayOfMonth(date: Date) -> Int
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
    
    
    
    
    
    
    func setWeekView()
    {
        
        totalSquares.removeAll()
        
        var current = self.sundayForDate(date: selectedDate)
        let nextSunday = self.addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = self.addDays(date: current, days: 1)
        }
        
        /* monthLabel.text = CalendarHelper().monthString(date: selectedDate)
             + " " + CalendarHelper().yearString(date: selectedDate)*/
        //collectionView.reloadData()
         //tableView.reloadData()
    }
       
    
    
    
    
}*/


class CalendarViewController: UIViewController, ObservableObject{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func getCurrentWeek() -> [String]{
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!

        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        //formatter.dateStyle = .short
        //formatter.timeStyle = .none



        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }  // use `compactMap` in Xcode 9.3 and later
            //.filter { !calendar.isDateInWeekend($0) }

        return days.map{ formatter.string(from: $0) }
    }
    
    func yep() -> [String]{
        return ["1", "2", "3", "4", "5", "6", "7"]
    }
    
  /*  func getNextWeek(today: Date, added: Int) -> [String]{
        let calendar = Calendar.current
        //let today = calendar.startOfDay(for: Date())
        let today = calendar.date(byAdding: .day, value: 7, to: today)
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!

        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        //formatter.dateStyle = .short
        //formatter.timeStyle = .none



        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }  // use `compactMap` in Xcode 9.3 and later
            //.filter { !calendar.isDateInWeekend($0) }

        return days.map{ formatter.string(from: $0) }
    }*/
    

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
        //MyView(viewModel: viewModel)
         
        
        
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
                        
                        Text("Josiah's Schedule")
                            .font(.system(size:30))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 0)
                        
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
                    
                    //viewModel.doSomething()
                    
                    //Text(function)
                    
                    //appView.dayOfMonth
                    //Text(viewModel.dayOfMonth(date: Date))
                    
                    //appView.doSomething()
                    //appView.setWeekView()
                    //Button(actionPressed:
                    
                    
                    var y = appView.getCurrentWeek()
                    
                    Button("Next", action:{
                        
                        y = appView.yep()
                        //appView.viewDidLoad()
                     
    
                    })
                    
                        //.onAppear{appView.viewDidLoad()}
                    
                    //Text("\(self.date)")
                    
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
                
                
              /*  Text("Daily Breakdown")
                
                    
                    .font(.system(size:23))
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 200)
                    //.padding(.bottom, 180)
                    .padding(.top,10)*/
                
                /*let caden = authRouter.displayEvent2()
                
                ForEach(caden, id: \.self){ item in
                    Spacer()
                    Text(item)
                        .font(.system(size:16))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        
                    Spacer()
                    
                    
                }*/
                
           /* .onAppear{ authRouter.displayEvent2()
            }*/
                   // .padding(.bottom, 160)
                
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
