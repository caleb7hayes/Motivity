//
//  UserProfilePage.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/22/22.
//

import SwiftUI

struct UserProfilePage: View {
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
                
               // Change User Name Section
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
                
                
                //Back and Confirm arrows
                
                HStack{
                    
                    Spacer()
                    Image("back arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    
                    Spacer()
                    
                    Image("CONFIRM BUTTON")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    Spacer()

                    
                }
                
                
            }
            
            
            
            
        }
        
        
        
        
    }
}

struct UserProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePage()
    }
}
