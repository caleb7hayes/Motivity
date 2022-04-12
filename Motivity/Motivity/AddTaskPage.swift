//
//  AddTaskPage.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/7/22.
//
import SwiftUI

struct AddTaskPage: View {
    
    
    @StateObject var viewRouter: ViewRouter
    
    @State private var notifications: Bool = false
    @State private var flexibleEvent: Bool = false
    
    
    var body: some View {
        
        ZStack{
            
            
            
            Image("ADD:EDIT BACKGROUND").ignoresSafeArea()
            
            
            VStack{
                
                
                HStack{
                    
                    Image("STYLE X")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 13, height: 13)
                        .padding(.top, 10)
                    
                    Text("Add Task")
                        .font(.system(size:25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    
                    Image("STYLE X")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 13, height: 13)
                        .padding(.top, 10)
                    
                }
                
                
                Image("ADD:EDIT TASK STYLE")
                    .padding(.top, -26)
                    .padding(.bottom,  150)
                
                
                
                //Event Name
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    Text("Event Name")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                     
                }
                
                //Start Time
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    Text("Start Time")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                     
                }
                
                
                //Duration
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    Text("Duration")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                     
                }
                
                
                //Location
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    Text("Location")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                     
                }
                
                
                //Notifications?
                
                HStack{
                    
                    ZStack{
                        
                        Image("SMALL TEXT BACKGROUND")
                        Text("Notifications")
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .opacity(0.3)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 20)
                        
                    }
                    
                    //padding adjustment for notifications bar
                    .padding(.leading, 25)
                    
                    
                    Toggle(isOn: $notifications){
                        
                        Text("")
                    }
                    .padding(.trailing,75)
                    
                }
                //Flexible Event??
                
                HStack{
                    
                    
                    ZStack{
                        
                        Image("SMALL TEXT BACKGROUND")
                        Text("Flexiblie Event")
                            .font(.system(size:23))
                            .fontWeight(.bold)
                            .opacity(0.3)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 44)
                        
                    }
                    
                    
                    Toggle(isOn: $flexibleEvent){
                        
                        Text("")
                    }
                    .padding(.trailing,75)
                }
                //padding adjustment for flexible event
                .padding(.leading, 25)
                
                
                
                // Exit and Confirm buttons
                HStack{
                    
                    Spacer()
                    Button(action:{
                        
                        viewRouter.currentPage = .calendarPage
                        
                    }){
                        
                        Image("back arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                    
                    
                    Spacer()
                    Spacer()
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .calendarPage
                        
                    }){
                        
                        Image("CONFIRM BUTTON")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                    
                    
                    Spacer()
                    
                    
                }
                
                .padding(.top,60)
                
                
                
                
            }
            
            
        }
    }
}




//toggle style attempt
struct toggleStyle: ToggleStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
        Button{
            
            configuration.isOn.toggle()
            
        } label:{
            
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            
        }

    }
}



struct AddTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPage(viewRouter: ViewRouter())
    }
}
