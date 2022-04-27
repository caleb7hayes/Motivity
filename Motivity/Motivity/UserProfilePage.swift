//
//  UserProfilePage.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//

import SwiftUI

struct UserProfilePage: View {
    
    @StateObject var viewRouter: ViewRouter
    
    

    
    
    var body: some View {
   
        ZStack{
        
            Image("Motivity Background").ignoresSafeArea()
       
            VStack{
                
                // User Profile Header
                HStack{
                    
                    Text("User Profile  ")
                        .font(.system(size:45))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Image("USER PROFILE ICON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                }
        
                //User Profile
                ZStack{
                    
                    Image("USER PROFILE CIRCLE")
                    
                    Image("USER PROFILE FILLER")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                    
                }
                
               // Change User Name
                HStack{
                    
                    VStack{
                        //Button Goes Here
                       Image("USER PROFILE")
                        
                    }
                    VStack{
                        
                        ZStack{
                            Image("Motivity Rectangle")
                            Text("Change User Name")
                                .font(.system(size:30))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
                // Language Section
                 HStack{
                     
                     VStack{
                         //Button Goes Here
                        Image("PASSWORD LOCK")
                         
                     }
                     VStack{
                         
                         ZStack{
                             Image("Motivity Rectangle")
                             Text("Change Password")
                                 .font(.system(size:30))
                                 .fontWeight(.bold)
                                 .foregroundColor(Color.white)
                             
                         }
                         
                         
                     }
                     
                     
                 }
                
                
                // User Growth Category
                 HStack{
                     
                     VStack{
                         
                         Button(action:{
                             
                             viewRouter.currentPage = .growthCategoriesPage
         
                         }){
                             
                             Image("USER GROWTH CATEGORY BUTTON")
                    
                         }
                         
                         
                         
                     }
                     VStack{
                         
                         ZStack{
                             Image("Motivity Rectangle")
                             
                             
                             Button(action:{
                                 
                                 viewRouter.currentPage = .growthCategoriesPage
             
                             }){
                                 
                                 Text("Growth Categories")
                                     .font(.system(size:25))
                                     .fontWeight(.bold)
                                     .foregroundColor(Color.white)
                             }
                             
                             
                             
                         }
                         
                         
                     }
                     
                     
                 }
                
                
                
                
                // Language Section
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
                
                
                
                
                
                
                //Back and Confirm arrows
                
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

struct UserProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePage(viewRouter: ViewRouter())
    }
}
