//
//  BigNavigationButton.swift
//  Synapse
//
//  Created by Will Hamilton on 11/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BigNavigationButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let text: String
    let destination: String
    
    var body: some View {
        Button(action: {
            self.viewRouter.currentPage = self.destination
        }) {
            Text(self.text)
                .padding()
                .font(Font.custom("Roboto-Thin", size:35))
                .foregroundColor(CustomColors().light)
        }.frame(minWidth: 0, maxWidth: .infinity)
        .background(CustomColors().lg)
        .cornerRadius(30)
        .padding()
        .foregroundColor(CustomColors().light)
    }
}

struct BigNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        BigNavigationButton(text: "Test", destination: "welcome").environmentObject(ViewRouter())
    }
}
