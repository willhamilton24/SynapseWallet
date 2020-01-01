//
//  StablecoinButton.swift
//  Synapse
//
//  Created by Will Hamilton on 1/1/20.
//  Copyright © 2020 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct StablecoinButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if self.viewRouter.coin == "USD" {
                Button(action: {}) {
                    Image("usd")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(12)
                }
                .background(CustomColors().lg)
                .foregroundColor(CustomColors().light)
                .mask(Circle())
            } else {
                Button(action: {self.viewRouter.coin = "USD"}) {
                    Image("usd")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(12)
                }
                .foregroundColor(CustomColors().lg)
                .mask(Circle())
            }
        }
    }
}

struct StablecoinButton_Previews: PreviewProvider {
    static var previews: some View {
        StablecoinButton().environmentObject(ViewRouter())
    }
}
