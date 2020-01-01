//
//  SignUpPage.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SignUpPage: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Text("")
            .frame(minWidth: screenSize.width, minHeight: screenSize.height + 120)
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().primeGradiant)
            
            VStack {
                BigLogo().frame(width: 500, height: 240)
                Spacer().frame(height: 40)
                OnboardingFlow().frame(height: 520)
            }.offset(y: -20)
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage().environmentObject(ViewRouter())
    }
}
