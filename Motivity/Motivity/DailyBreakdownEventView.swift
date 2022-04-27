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
        return String(newHour)
    }
    
    var body: some View {
        
        if eventType == "Rest"{
            
            ZStack{
                
                Image("red event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration) + ":00")
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
        
        if eventType == "Work"{
            
            ZStack{
                
                Image("blue event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration) + ":00")
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
        
        
        if eventType == "Health"{
            
            ZStack{
                
                Image("green event")
                
                HStack{
                    Spacer()
                    
                    VStack{
                        
                        Text(StartTime + " -")
                            .font(.system(size:14))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        
                        Text(endTime(startTime: StartTime, eventduration: EventDuration) + ":00")
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










struct DailyBreakdownEventView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        VStack{
            
            DailyBreakdownEventView(authRouter: AuthRouter(), Event: "Date Night", StartTime: "11:00", EventDuration: 1, eventType: "Rest")
            
            
            
        
            
        }
        
        
    }
}
