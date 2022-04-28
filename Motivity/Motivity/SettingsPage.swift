//
//  SettingsPage.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//

import SwiftUI

struct SettingsPage: View {
    
    @StateObject var viewRouter: ViewRouter
    
    
    var body: some View {
        
        ZStack{
            
            Image("Motivity Background").ignoresSafeArea()
            
            
            VStack{
                
                
                HStack{
                    
                    Text("Settings")
                        .font(.system(size:45))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Image("GEAR ICON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                    
                }
                
                
                //Language Section
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("LANGUAGE BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Language")
                                .font(.system(size:35))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                // Region and Time Zone
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("REGION AND TIME BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Region and Time Zone")
                                .font(.system(size:25))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                //Notifications Setting Section
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("NOTFICATIONS BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Notifications Setting")
                                .font(.system(size:25))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                    
                    }
              
                }
                
                //Theme Section
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("THEME BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Theme")
                                .font(.system(size:35))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                   
                    }

                }
                
                // Productivity Goals Section
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("PRODUCTIVITY GOALS BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Productivity Goals")
                                .font(.system(size:28))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                      
                    }
                   
                }
                //Filler Section
                
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("FILLER BUTTON")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            
                            Text("Filler")
                                .font(.system(size:35))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                     
                    }
                   
                }
             
                //ARROW AND CONFIRM BUTTON SECTION
                
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
           
            }
    
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage(viewRouter: ViewRouter())
    }
}


