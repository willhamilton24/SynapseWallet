//
//  OnboardingHeader.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct OnboardingHeader: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Getting Started")
                .font(Font.custom("Roboto-Light", size: 24))
                .padding()
            
            Divider()
                .frame(width: 350, height: 1)
        }
    }
}

struct OnboardingHeader_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingHeader()
    }
}
