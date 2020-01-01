//
//  BalanceModuleUSD.swift
//  Synapse
//
//  Created by Will Hamilton on 1/1/20.
//  Copyright © 2020 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BalanceModuleUSD: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Balance") // Balance Label
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:18))
            HStack {
                Text(String(self.viewRouter.balances.usd))
                    .font(Font.custom("Roboto-Thin", size:46))
                Text("USDT")
                    .font(Font.custom("Roboto-Thin", size:32))
                    .padding(.top, 10)
            }.foregroundColor(CustomColors().light)
            Text("$" + String(self.viewRouter.accountValues.usd) + "0" + " USD")
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:24))
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(width: 340, height: 2.5, alignment: .center)
                .foregroundColor(.white)
                .background(CustomColors().light)
                
        }.onAppear {
            self.viewRouter.accountValues.usd = self.viewRouter.prices.usd * self.viewRouter.balances.usd
            self.viewRouter.accountValues.usd = round(100.0 * self.viewRouter.accountValues.usd) / 100.0

        }
    }
}

struct BalanceModuleUSD_Previews: PreviewProvider {
    static var previews: some View {
        BalanceModuleUSD().environmentObject(ViewRouter())
    }
}
