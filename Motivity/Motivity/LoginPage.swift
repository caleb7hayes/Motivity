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
                
                
                
                Text("New user?")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                
                
                //format text to top third of the screen
                
                ZStack(){
                    
                    Image("Button Ring")
                        .padding(.top, 400)
                        .frame(minWidth: 0, maxWidth:100, minHeight: 0, maxHeight:100)
                    
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .existingUserPage
                        print("hello")
                    }){
                        
                        Image("SIGN UP WITH EMAIL")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 0)
                            .padding(.top, 400)
                            .frame(minWidth: 0, maxWidth:100, minHeight: 0, maxHeight:300)
                        
                    }
                    
           }
                
                
                Spacer()
                
                //button to naviagte to the next page
                Button(action:{
                    
                    viewRouter.currentPage = .existingUserPage
                    print("hello")
                }){
                    
                    Image("Already have an account?")
                        .padding(.top, 23.0)
                        .frame(width: /*@START_MENU_TOKEN@*/101.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    
                }
                
                
                
                
                //button to naviagte to the next page
                Button(action:{
                    
                    viewRouter.currentPage = .welcomePage
                    
                }){
                    
                    Image("back arrow")
                        .padding(.top, 23.0)
                        .frame(width: /*@START_MENU_TOKEN@*/101.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    
                }
                
                
                    
                
                
                Spacer()
                
                
            }
            
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
