//
//  OnboardingFooter.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingFooter: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            Divider()
                .frame(width: 350, height: 1)
            
            HStack {
                Button(action: {
                    if self.viewRouter.signUpPage > 0 {
                        self.viewRouter.signUpPage -= 1
                    } else {
                        self.viewRouter.currentPage = "welcome"
                    }
                }) {
                    Image("back")
                    .resizable()
                    .frame(width: 50, height: 50)
                }
                .foregroundColor(CustomColors().lg)
                .frame(width: 50, height: 50)
                
                OnboardingProgress()
                    .padding()
                
                Button(action: {
                    if self.viewRouter.signUpPage < 5 {
                        self.viewRouter.signUpPage += 1
                    }
                }) {
                    Image("forward")
                    .resizable()
                    .frame(width: 50, height: 50)
                }.foregroundColor(CustomColors().lg)
            }.padding(.bottom)
        }.background(CustomColors().light2)
    }
}

struct OnboardingFooter_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFooter().environmentObject(ViewRouter())
    }
}
