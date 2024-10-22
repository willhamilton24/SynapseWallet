//
//  BigLogo.swift
//  Synapse
//
//  Created by Will Hamilton on 10/8/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BigLogo: View {
    var body: some View {
            VStack(alignment: .leading) {
                Spacer().frame(height: 120)
                Text("SYNAPSE")
                Text("WALLET.")
            }
            .font(Font.custom("Roboto-Thin", size:68))
            .padding()
            .foregroundColor(CustomColors().light)
            .frame(width: 500, height: 320)
            .fixedSize()
            .edgesIgnoringSafeArea(.top)
    }
}

struct BigLogo_Previews: PreviewProvider {
    static var previews: some View {
        BigLogo()
    }
}
