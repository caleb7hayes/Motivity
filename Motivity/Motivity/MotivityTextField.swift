//
//  MotivityTextField.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/22/22.
//

import SwiftUI

struct MotivityEmailField: View {
    
    @Binding var email: String
    
    let placeHolderView: Text
    let image: String // this will just be the motovity logo for each field (120x120x icon)
    
    var body: some View {
        
        ZStack{
            
            if email.isEmpty{
                //normal display without text field
                placeHolderView
                    .foregroundColor(Color(.init(white:3, alpha: 0.87)))
                    .fontWeight(.semibold)
                    //.padding(.leading,30)
                    .font(.system(size:25))
                    
                
                
            }
            
            HStack{
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.leading,100)
                
                TextField("", text: $email)
                
                
                
            }
            
            
        }
        
        
    }
}


struct MotivityPasswordField: View {
    
    
    
    @Binding var password: String
    
    let placeHolderView: Text
    
    var body: some View {
        
        ZStack{
            
            if password.isEmpty{
                //normal display without text field
                placeHolderView
                    .foregroundColor(Color(.init(white:3, alpha: 0.87)))
                    .fontWeight(.semibold)
                    //.padding(.leading,30)
                    .font(.system(size:25))
                    
                
                
            }
            
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.leading,100)
                
                SecureField("", text: $password)
                
                
                
            }
            
            
        }
        
        
    }
}
