//
//  XButton.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct XButton: View {
    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
        Button(action: {
            self.viewRouter.currentPage = "main"
        }) {
            Image("x")
            .resizable()
            .frame(width: 55, height: 55)
            .foregroundColor(CustomColors().light)
        }
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton(viewRouter: ViewRouter())
    }
}
