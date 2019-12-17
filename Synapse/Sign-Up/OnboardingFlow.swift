//
//  OnboardingFlow.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingFlow: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var pageIndex: Int = 0
    
    var body: some View {
        VStack {
            OnboardingHeader()
            
            Spacer()
                .frame(width: 350, height: 400)
                .background(Color.white)
            
            OnboardingFooter()
        }
        .background(CustomColors().light2)
        .cornerRadius(20)
        .clipped()
        .shadow(color: .gray, radius: 2)
    }
}

struct OnboardingFlow_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlow().environmentObject(ViewRouter())
    }
}
