//
//  OnboardingProgress.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingProgress: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            OnboardingPageDot(pageRepresented: 0)
            OnboardingPageDot(pageRepresented: 1)
            OnboardingPageDot(pageRepresented: 2)
            OnboardingPageDot(pageRepresented: 3)
            OnboardingPageDot(pageRepresented: 4)
            OnboardingPageDot(pageRepresented: 5)
        }
    }
}

struct OnboardingProgress_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingProgress().environmentObject(ViewRouter())
    }
}
