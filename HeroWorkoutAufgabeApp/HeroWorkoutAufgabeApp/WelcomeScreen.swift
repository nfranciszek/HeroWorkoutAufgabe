//
//  WelcomeScreen.swift
//  HeroWorkoutAufgabeApp
//
//  Created by Nathanael Franciszek on 1/16/21.
//

import SwiftUI

struct WelcomeScreen: View {

    var companyLogo = "TransparentZONEHW"

    
    var body: some View {
       
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Image(companyLogo).resizable().frame(width: 250, height: 250).scaledToFit()
                    
                    
                }
                
                
            }
        }
        
        
    }

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
