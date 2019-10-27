//
//  BalanceModule.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BalanceModule: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text("Balance") // Balance Label
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:18))
            HStack {
                Text(String(self.viewRouter.balances.btc))
                    .font(Font.custom("Roboto-Thin", size:46))
                Text("BTC")
                    .font(Font.custom("Roboto-Thin", size:32))
                    .padding(.top, 10)
            }.foregroundColor(CustomColors().light)
            Text("$" + String(self.viewRouter.accountValues.btc) + "0" + " USD")
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:24))
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(width: 300, height: 2.5, alignment: .center)
                .foregroundColor(.white)
                .background(CustomColors().primeGradiant)
                
        }.onAppear {
            self.viewRouter.accountValues.btc = self.viewRouter.prices.btc * self.viewRouter.balances.btc
            self.viewRouter.accountValues.btc = round(100.0 * self.viewRouter.accountValues.btc) / 100.0

        }
    }
}

struct BalanceModule_Previews: PreviewProvider {
    static var previews: some View {
        BalanceModule(viewRouter: ViewRouter())
    }
}
