//
//  CalendarView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//
import SwiftUI

struct CalendarView: View {
    
    
    @StateObject var viewRouter: ViewRouter
    
    
    var data = ["Sun.", "Mon.", "Tues", "Wed.", "Thur.", "Fri.", "Sun."]
    var dates = ["20", "21", "22", "23", "24", "25", "26",]
    
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
                        
                        Text("Josiah's Schedule")
                            .font(.system(size:30))
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 0)
                        
                        Text("April 20th - 26th")
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
                    ForEach(dates, id: \.self){ item in
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
                        
                        viewRouter.currentPage = .addTaskPage
    
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
                
                
                //Daily Breakdown
                
                
                Text("Daily Breakdown")
                    
                    .font(.system(size:23))
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 200)
                    .padding(.bottom, 180)
                    .padding(.top,10)
                    
            }
            
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewRouter: ViewRouter())
    }
}
