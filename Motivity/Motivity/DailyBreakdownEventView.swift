//
//  DailyBreakdownEventView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/25/22.
//

import SwiftUI

struct DailyBreakdownEventView: View {
    
    
    @StateObject var authRouter: AuthRouter
    
    
    //let eventCounter: int
    let Event: String
    let StartTime: String
    var EventDuration: Int
    var eventType: String // 'work' or 'health' or 'rest'
    
    
    func endTime(startTime: String, eventduration: Int) -> String{
        let ch = Character(":")
        let startHour = startTime.split(separator: ch)
        let newHour = Int(startHour[0])! + eventduration
        return String(newHour) + ":" + String(startHour[1])
    }
    
    var body: some View {
        
        if eventType.isEqual("Rest"){
            
            ZStack{
                
                Image("red event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration))
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                    
                    Text(Event)
                        .font(.system(size:24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Spacer()
                    
                    Text(eventType)
                        .font(.system(size:14))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
            }
            
        }
        
        if eventType.isEqual("Work"){
            
            ZStack{
                
                Image("blue event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration))
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                    
                    Text(Event)
                        .font(.system(size:24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Spacer()
                    
                    Text(eventType)
                        .font(.system(size:14))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
            }
            
        }
        
        
        if eventType.isEqual("Health"){
            
            ZStack{
                
                Image("green event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration))
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                    
                    Text(Event)
                        .font(.system(size:24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Spacer()
                    
                    Text(eventType)
                        .font(.system(size:14))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                
            }
            
        }
        
        
        
        
        
    }
}



struct MainCalendarEventView: View {
    
    
    @StateObject var authRouter: AuthRouter
    
    
    let eventDate: String
    let Event: String
    let StartTime: String
    var EventDuration: Int
    var eventType: String // 'work' or 'health' or 'rest'
    
    
    func eventXPostion(eventDate: String) -> String {
        
        var xPostion: Int
        
        switch eventDate{
        case "24":
            xPostion = 32
        case "25":
            xPostion = 91
        case "26":
            xPostion = 154
        case "27":
            xPostion = 222
        case "28":
            xPostion = 285
        case "29":
            xPostion = 345
        case "30":
            xPostion = 400
        default:
            xPostion = 0
        }
    
        return String(xPostion)
        
    }
    
    
    
    func eventYPostion(StartTime:String) -> CGFloat{
        let ch = Character(":")
        let startHour = StartTime.split(separator: ch)
        let startHourString = String(startHour[0])
        var yPosition: CGFloat
        let StartTimeCGFloat = CGFloat(Double(startHourString) ?? 0)
        yPosition = 180 + ((StartTimeCGFloat * 11.00))
        return yPosition
        
    }
    
    
    
    var body: some View {
        
        if eventType == "Work"{
            
            let xLocation = eventXPostion(eventDate: eventDate)
            let xLocationCG = CGFloat(Double(xLocation) ?? 0)
            
            let yLocationCG = eventYPostion(StartTime: StartTime)
            
            
            if EventDuration <= 1{
                
                Image("blue short")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
            
            else if EventDuration <= 3{
                
                Image("blue med")
                    .position(x: xLocationCG, y: yLocationCG)
                
                
            }
            
            else{
                
                Image("blue long")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
        }
        
        if eventType == "Health"{
            
            let xLocation = eventXPostion(eventDate: eventDate)
            let xLocationCG = CGFloat(Double(xLocation) ?? 0)
            
            let yLocationCG = eventYPostion(StartTime: StartTime)
            
            
            if EventDuration <= 1{
                
                Image("green short")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
            
            else if EventDuration <= 3{
                
                Image("green med")
                    .position(x: xLocationCG, y: yLocationCG)
                
                
            }
            
            else{
                
                Image("green long")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
        }
        
        if eventType == "Rest"{
            
            let xLocation = eventXPostion(eventDate: eventDate)
            let xLocationCG = CGFloat(Double(xLocation) ?? 0)
            
            let yLocationCG = eventYPostion(StartTime: StartTime)
            
            
            if EventDuration <= 1{
                
                Image("red short")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
            
            else if EventDuration <= 3{
                
                Image("red med")
                    .position(x: xLocationCG, y: yLocationCG)
                
                
            }
            
            else {
                
                Image("red long")
                    .position(x: xLocationCG, y: yLocationCG)
                
            }
        }

        
        
        
        
    }
}


    
    struct DailyBreakdownEventView_Previews: PreviewProvider {
        static var previews: some View {
            
            
            
            ZStack{
                
                Image("Calendar Demo View").ignoresSafeArea()
                VStack{
                    
                    
                    
                    MainCalendarEventView(authRouter: AuthRouter(),eventDate: "30", Event: "Mother's Day", StartTime: "13:00", EventDuration: 4, eventType: "Rest")
                    
                    
                }
                
                
                
                    
                    DailyBreakdownEventView(authRouter: AuthRouter(), Event: "Test", StartTime: "12:00", EventDuration: 4, eventType: "Work")
                     .position(x: 210, y: 710 )
                    
                
            }
            
        }
    }

