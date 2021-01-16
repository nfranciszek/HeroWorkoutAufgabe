//
//  ViewBottom.swift
//  HeroWorkoutAufgabeApp
//
//  Created by Nathanael Franciszek on 1/16/21.
//

import SwiftUI

struct ViewBottom: View {

    var darkColorTrans: Color = Color.darkColorTrans
    
    var body: some View {
        ZStack {
            
            
         
          
       
                       
                    
                   Rectangle()
                                .fill(self.darkColorTrans)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                          .edgesIgnoringSafeArea(.all)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct ViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        ViewBottom()
    }
}
