//
//  GettingStartedText.swift
//  Synapse
//
//  Created by Will Hamilton on 10/10/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct GettingStartedText: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 35)
            
            Text("Getting Started...").foregroundColor(CustomColors().light).font(Font.custom("Roboto-Thin", size:20))
            
            Spacer().frame(height: 13)
        }
    }
}

struct GettingStartedText_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedText()
    }
}
