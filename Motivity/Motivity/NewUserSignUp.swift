//
//  NewUserSignUp.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/18/22.
//

import SwiftUI

struct NewUserSignUp: View {
    
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack{
            
            Image("Motivity Login Background").ignoresSafeArea()
            
            
            
            VStack{
                
                //Motivity + New User Stack
                VStack(){
                
                    Text("Motivity")
                        
                        .font(.system(size:55))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        //.padding(.vertical)
                    
                    
                    
                    Text("New user")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        
                }
                
                // Seperation between Motivity and New User Text over Email + password stack
                .padding(.top, 130)
                .padding(.bottom,100)
                
                // Email + Password Stack
                VStack{

                    ZStack(){
                        
                        Image("Button Ring")
                        
                        Image("EMAIL")
                    }
        
                    ZStack(){
                        
                        Image("Button Ring")

                        Image("PASSWORD")
     
                        
                    }
                    
                    ZStack(){
                        
                        Image("Button Ring")

                        Image("PASSWORD")
      
                    }

                    
                }
                  
                //Seperation between Email + Password stack and Sign up Stack
                .padding(.top, 150)
                .padding(.bottom, 20)
                
                // Sign Up + Back Arrow Stack
                VStack{
                              
                    Button(action:{
                        
                        viewRouter.currentPage = .calendarPage
                    }){
                        
                        Image("SIGN UP BUTTON")
                            
                    }
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .calendarPage
                        
                    }){
                        
                        Image("back arrow")
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                    }
                        
                }
                
                //.padding(.top, 30)
            }
        }
    }
}

struct NewUserSignUp_Previews: PreviewProvider {
    static var previews: some View {
        NewUserSignUp(viewRouter: ViewRouter())
    }
}
