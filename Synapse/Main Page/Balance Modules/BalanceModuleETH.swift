//
//  BalanceModuleETH.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BalanceModuleETH: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text("Balance") // Balance Label
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:18))
            HStack {
                Text(String(self.viewRouter.balances.eth))
                    .font(Font.custom("Roboto-Thin", size:46))
                Text("ETH")
                    .font(Font.custom("Roboto-Thin", size:32))
                    .padding(.top, 10)
            }.foregroundColor(CustomColors().light)
            Text("$" + String(self.viewRouter.accountValues.eth) + " USD")
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:24))
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(width: 340, height: 2.5, alignment: .center)
                .foregroundColor(.white)
                .background(CustomColors().light)
                
        }.onAppear {
            print(self.viewRouter.prices.eth)
        }
    }
}

struct BalanceModuleETH_Previews: PreviewProvider {
    static var previews: some View {
        BalanceModuleETH().environmentObject(ViewRouter())
    }
}
