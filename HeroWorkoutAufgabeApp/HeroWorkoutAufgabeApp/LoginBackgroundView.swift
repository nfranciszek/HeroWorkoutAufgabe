//
//  LoginBackgroundView.swift
//  HeroWorkoutAufgabeApp
//
//  Created by Nathanael Franciszek on 1/16/21.
//

import SwiftUI

struct LoginBackgroundView: View {
    var darkColorTrans: Color = Color.darkColorTrans
    var backgroundPhoto = "workoutGirl"
    
    var body: some View {
        ZStack {
            Image(backgroundPhoto)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Rectangle()
                    .foregroundColor(self.darkColorTrans)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                
                    
                    
                }
                
                
            }
        }
        
        
    }


struct LoginBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        LoginBackgroundView()
    }
}
