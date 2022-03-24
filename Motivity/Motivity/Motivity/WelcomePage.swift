//
//  ContentView.swift
//  Motivity
//
//  Created by Josiah Schwahn on 3/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = "schwahn.josiah@gmail.com"
    @State var password = "password123"
    
    
    var body: some View {
        
        
        ZStack{
            
            //background image for all pages throughout Motvitiy
            Image("Motivity Login Background").ignoresSafeArea()
            
            
            //vertical stack for top text
            VStack(alignment: .leading, spacing: 5){
                
                Spacer()
                
                
                Text("Welcome to Motivity")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,49)
                
                
                Text("\"where movement creates motivation\"")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.leading, 90)
                
                //format text to top third of the screen
                Spacer()
                Spacer()
                
                ZStack{
                    
                    Image("ENTER")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,170)
            
                    Image("Button Ring")
                        .padding(.leading)
                    
                }
                
                
                
                Spacer()
                
                
            }
            
        }
        
    }
    
    //methods for the structer
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}




