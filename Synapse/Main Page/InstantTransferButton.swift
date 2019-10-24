//
//  InstantTransferButton.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct InstantTransferButton: View {
    var body: some View {
        NavigationLink(destination: InstantTransferPage()) {
            HStack(spacing: 0) {
                Text("Instant")
                    .font(Font.custom("Roboto-Light", size:14))
                Image("bolt")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Transfer")
                    .font(Font.custom("Roboto-Light", size:14))
            }
            .padding(12)
        }
        .frame(minWidth: 150, maxWidth: 180)
        .background(CustomColors().lg)
        .cornerRadius(25)
        .padding()
        .padding(.vertical, 0)
        .foregroundColor(CustomColors().light)
    }
}

struct InstantTransferButton_Previews: PreviewProvider {
    static var previews: some View {
        InstantTransferButton()
    }
}
