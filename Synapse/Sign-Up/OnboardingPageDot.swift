//
//  OnboardingPageDot.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingPageDot: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var pageRepresented: Int
    
    var body: some View {
        VStack {
            if self.viewRouter.signUpPage >= self.pageRepresented {
                Image("dot-p")
                .resizable()
                .frame(width: 15, height: 15)
            } else {
                Image("dot-n")
                .resizable()
                .frame(width: 15, height: 15)
            }
        }
    }
}

struct OnboardingPageDot_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageDot(pageRepresented: 1).environmentObject(ViewRouter())
    }
}
