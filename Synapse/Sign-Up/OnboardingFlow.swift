//
//  OnboardingFlow.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingFlow: View {
    var body: some View {
        VStack {
            Text("Getting Started")
            
            Spacer().frame(width: 350, height: 450)
            
            HStack {
                Button(action: {}) {
                    Image("out")
                }
                
                Spacer().frame(width: 200, height: 75)
                
                Button(action: {}) {
                    Image("check")
                }
            }
        }
    }
}

struct OnboardingFlow_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlow()
    }
}
