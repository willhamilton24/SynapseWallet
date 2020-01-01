//
//  OnboardingContent.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingContent: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if self.viewRouter.signUpPage == 0 {
                ChooseHandleView().frame(width: 350, height: 350).transition(.opacity)
            } else if self.viewRouter.signUpPage == 1 {
                EmailAndAgeView().frame(width: 350, height: 350).transition(.opacity)
            } else if self.viewRouter.signUpPage == 2 {
                PhoneNumberView().frame(width: 350, height: 350).transition(.opacity)
            } else if self.viewRouter.signUpPage == 3 {
                SetPasswordView().frame(width: 350, height: 350).transition(.opacity)
            } else if self.viewRouter.signUpPage == 4 {
                KeepLogsView().frame(width: 350, height: 350).transition(.opacity)
            } else if self.viewRouter.signUpPage == 5 {
                ChooseVerifView().frame(width: 350, height: 350).transition(.opacity)
            } else {
                Text("Sign Up Slide Placeholder")
                .frame(width: 350, height: 350)
            }
        }.frame(width: 350, height: 350)
    }
}

struct OnboardingContent_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent().environmentObject(ViewRouter())
    }
}
