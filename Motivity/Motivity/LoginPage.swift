//
//  SwiftUIView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/18/22.
//

import SwiftUI

struct LoginPage: View {

    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    
    var body: some View {
        
        
        ZStack{
            
            //background image for all pages throughout Motvitiy
            Image("Motivity Login Background").ignoresSafeArea()
            
            
            //vertical stack for top text
            VStack(){
                
                Spacer()
                
                
                Text("Motivity")
                    .font(.system(size:55))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 10)
                
                
                
                Text("New user?")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 210)
                
                
                //format text to top third of the screen
                
                ZStack(){
                    
                    Image("Button Ring")
                        .padding(.bottom, 40)
                    
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .newUserPage
                        
                    }){
                        
                        Image("SIGN UP WITH EMAIL")
                            .padding(.bottom, 40)
                        
                        
                    }
                    
                }
                
                
                
                
                //button to naviagte to the next page
                Button(action:{
                    
                    viewRouter.currentPage = .existingUserPage
                    print("hello")
                }){
                    
                    Image("Already have an account?")
                        .padding(.bottom, 70.0)
                        
                    
                }
                
                
                
                
                //button to naviagte to the next page
                Button(action:{
                    
                    viewRouter.currentPage = .welcomePage
                    
                }){
                    
                    Image("back arrow")
                        .padding(.bottom, 100.0)
                        .frame(width: 150, height: 150)
                    
                    
                }
                
                
                    
                
                
                
                
                
            }
            
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
