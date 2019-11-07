//
//  BackButton.swift
//  Synapse
//
//  Created by Will Hamilton on 11/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let destination: String
    
    var body: some View {
        Button(action: {
            self.viewRouter.currentPage = self.destination
        }) {
            Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
        }.frame(minWidth: 225, maxWidth: 250)
            .background(CustomColors().lg)
            .cornerRadius(25)
            .padding()
            .padding(.vertical, 0)
            .foregroundColor(CustomColors().light)
    }
}


struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(destination: "welcome").environmentObject(ViewRouter())
    }
}
