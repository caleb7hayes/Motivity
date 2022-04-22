//
//  AddTaskPage.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/7/22.
//
import SwiftUI

struct AddTaskPage: View {
    
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    @State private var notifications: Bool = false
    @State private var flexibleEvent: Bool = false
    
    @State var name = ""
    @State var start = ""
    @State var dur = ""    
    
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
                    TextField("Event Name", text: $name)
                        .font(.system(size:30))
                       
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                      
                     
                }
                
                //Start Time
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    TextField("Start Time", text: $start)
                        .font(.system(size:30))
                        
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        
                     
                }
                
                
                //Duration
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                    TextField("Durration", text: $dur)
                        .font(.system(size:30))
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                     
                }
                
                
                //Location
                ZStack(alignment:.leading){
                    
                    
                    Image("LARGE TEXT BACKGROUND")
                     
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
                        authRouter.createEvent(name: name, start: start, dur: dur)
                        
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
        AddTaskPage(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
