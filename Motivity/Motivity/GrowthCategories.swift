//
//  GrowthCategories.swift
//  Motivity
//
//  Created by Josiah Schwahn on 4/26/22.
//

import SwiftUI

struct GrowthCategories: View {
    
    @StateObject var viewRouter: ViewRouter
    @StateObject var authRouter: AuthRouter
    
    //growth categories toggle switch stateObjects
    @State var categorey1: Bool = false
    @State var categorey2: Bool = false
    @State var categorey3: Bool = false
    @State var categorey4: Bool = false
    @State var categorey5: Bool = false
    @State var categorey6: Bool = false

  
    var body: some View {
        
        ZStack{
            
            Image("Motivity Background").ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Spacer()
                    Text("Growth Categories")
                        .font(.system(size:36))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                    Image("GROWTH ARROW")
                    Spacer()
                    
                }
                
                Text("Where do you want to focus?")
                    .font(.system(size:18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                
                    .padding(.bottom, 60)
                
// -------------------------------------------------------------
                
                
                //Specific types of growth categories
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Rest")
                            .font(.system(size:35))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey1){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Self-deveolpment")
                            .font(.system(size:26))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey2){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Physical Health")
                            .font(.system(size:28))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey3){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Time in Community")
                            .font(.system(size:25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey4){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Spiritual Health")
                            .font(.system(size:26))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey5){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                
                
                HStack{
                    
                    ZStack{
                        
                        Image("growthCategoriesBackground")
                        Text("Entertainment")
                            .font(.system(size:26))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    
                        
                    }
                    Toggle(isOn: $categorey6){
                        
                        Text("")
                    }
                    .padding(.trailing,60)
                    
                    
                }
                
                .padding(.bottom, 60)
                
                
                HStack{
                    
                    Spacer()
                    Button(action:{
                        
                        viewRouter.currentPage = .userProfilePage
    
                    }){
                        
                        Image("back arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                        
                    
                    Spacer()
                    
                    Button(action:{
                        
                        viewRouter.currentPage = .userProfilePage
    
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

struct GrowthCategories_Previews: PreviewProvider {
    static var previews: some View {
        GrowthCategories(viewRouter: ViewRouter(), authRouter: AuthRouter())
    }
}
