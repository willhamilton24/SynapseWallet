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
            HStack(spacing: 5) {
                Text("Instant")
                Text("Transfer")
            }.font(.headline)
             .padding(.all, 12)
             .foregroundColor(.yellow)
             .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.yellow, lineWidth: 2)
            )
        }.frame(width: 250)
    }
}

struct InstantTransferButton_Previews: PreviewProvider {
    static var previews: some View {
        InstantTransferButton()
    }
}
