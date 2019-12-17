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
                ChooseHandleView().transition(.opacity)
            } else if self.viewRouter.signUpPage == 1 {
                EmailAndPhoneView().transition(.opacity)
            } else if self.viewRouter.signUpPage == 2 {
                SetPasswordView().transition(.opacity)
            } else if self.viewRouter.signUpPage == 3 {
                KeepLogsView().transition(.opacity)
            } else if self.viewRouter.signUpPage == 4 {
                AcceptTermsView().transition(.opacity)
            } else if self.viewRouter.signUpPage == 5 {
                ChooseVerifView().transition(.opacity)
            } else {
                Text("Sign Up Slide Placeholder")
                .frame(width: 350, height: 350)
            }
        }
    }
}

struct OnboardingContent_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent().environmentObject(ViewRouter())
    }
}
