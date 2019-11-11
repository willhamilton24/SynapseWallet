//
//  ProfileButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfileButtons: View {
    var body: some View {
        HStack (spacing: 25) {
            Button(action: {}) {
                Text("Save").font(.custom("Roboto-Thin", size:28))
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(CustomColors().lg)
            .cornerRadius(25)
            
            Button(action: {}) {
                Text("Logout").font(.custom("Roboto-Thin", size:28))
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(CustomColors().lg)
            .cornerRadius(25)
        }
        .foregroundColor(CustomColors().light)
    }
}

struct ProfileButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtons()
    }
}
