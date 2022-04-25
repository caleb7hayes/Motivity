//
//  MotivityTextField.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/22/22.
//

import SwiftUI

struct MotivityTextField: View {
    
    @State var ourText: String
    
    let placeHolderView: Text
    let motivityLogo: String // this will just be the motovity logo for each field (120x120x icon)
    
    var body: some View {
        
        ZStack{
            
            if ourText.isEmpty{
                //normal display without text field
                placeHolderView
                    .foregroundColor(Color(.init(white:3, alpha: 0.87)))
                    .padding(.leading,40)
                
                
            }
            
            HStack{
                Image("Motivity Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                
                SecureField("", text: $ourText)
                
                
                
            }
            
            
        }
        
        
    }
}

