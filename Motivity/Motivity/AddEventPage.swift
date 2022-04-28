//
//  AddEventPage.swift
//  Motivity
//
//  Created by Caden Senitte on 4/25/22.
//

import SwiftUI

struct Types {

  var selection = [
    "Select Event Type", "Health", "Work", "Rest"
  ]
}



class AddEventController: UIViewController, ObservableObject{
    
    func dateToString(picker: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let pick = dateFormatter.string(from: picker)
        return String(pick)
    }
    
    func timeToString(picker: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let pick = dateFormatter.string(from: picker)
        return String(pick)
    }
    
}

struct AddEventPage: View {
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var appView = AddEventController()
    
    @State private var notifications: Bool = false
    @State private var flexibleEvent: Bool = false
    
    @State private var eventName = ""
    @State private var duration = ""
    //@State private var eType = ""
    @State private var eventDate = Date()
    
    @StateObject var authRouter: AuthRouter
    
    let types = Types()
    
    @State var selectedType: Int = .zero

    
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
                    
                    Text("Add Event")
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
                    
                    TextField("Event Name", text: $eventName)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                    
                   /* Image("LARGE TEXT BACKGROUND")
                    Text("Event Name")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)*/
                     
                }
                
                //Event Date
                ZStack(alignment:.leading){
                    
                    DatePicker("Event Date", selection: $eventDate)
                        .background(Color.white)
                                .padding()
                    
                    
                                
                    
                   /* Image("LARGE TEXT BACKGROUND")
                    Text("Event Name")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)*/
                     
                }
                
                //Start Time
             /*   ZStack(alignment:.leading){
                    
                    TextField("Start Time", text: $startTime)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                    
                    
                  /*  Image("LARGE TEXT BACKGROUND")
                    Text("Start Time")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)*/
                     
                }*/
                
                
                //Duration
                ZStack(alignment:.leading){
                    
                    TextField("Duration", text: $duration)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                    
                    
                  /*  Image("LARGE TEXT BACKGROUND")
                    Text("Duration")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)*/
                     
                }
                
                
                //Location
                ZStack(alignment:.leading){
                    
                    /*TextField("Event Type", text: $eType)
                                .textFieldStyle(.roundedBorder)
                                .padding()*/
                    /*Menu {
                        Button {
                            
                        } label: {
                            Text("Health")
                            Image(systemName: "heart")
                        }
                        Button {
                            
                        } label: {
                            Text("Work")
                            Image(systemName: "hammer")
                        }
                        Button {
                            
                        } label: {
                            Text("Rest")
                            Image(systemName: "sleep")
                        }
                    } label: {
                         Text("Event Type")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .opacity(0.3)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 30)
                         Image(systemName: "tag.circle")
                    }*/
                    
                   /* Image("LARGE TEXT BACKGROUND")
                    Text("Location")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)*/
                    
                    
                       Menu {
                         ForEach(types.selection.indices, id: \.self) { indice in
                           Button(action: {
                             selectedType = indice
                           }) {
                             HStack {
                               if selectedType == indice {
                                 HStack {
                                   Text("\(types.selection[indice])")
                                   Image(systemName: "checkmark")
                                 }
                               }
                               else {
                                 Text("\(types.selection[indice])")
                               }
                             }
                           }}}
                label:{
                    Text("\(types.selection[selectedType])")
                        //.font(.system(size:))
                        .fontWeight(.bold)
                        .opacity(0.3)
                      .frame(minWidth: 120, minHeight: 40, alignment: .center)
                      .font(.headline)
                      .foregroundColor(.gray)
                      .multilineTextAlignment(.center)
                      .id(selectedType)
                      .padding([.trailing], 250)
                      .background(.white)
                }
                .padding([.bottom], 50)
                    
                    
                     
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
                    
                    let castDate = appView.dateToString(picker: eventDate)
                
                    let castTime = appView.timeToString(picker: eventDate)
                    
                    let castType = types.selection[selectedType]
                    
                    Button(action:{
                        
                        
                        authRouter.createEvent(name: eventName, startDate: castDate, startTime: castTime, dur: duration, eventType: castType)
                        
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



struct AddEventPage_Previews: PreviewProvider {
    static var previews: some View {
        AddEventPage(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
