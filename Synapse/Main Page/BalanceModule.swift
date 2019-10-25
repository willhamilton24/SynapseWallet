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
            Text(String(self.viewRouter.balances.btc) + " BTC")
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Thin", size:46))
            Text("$" + String(self.viewRouter.prices.btc) + " USD")
                .foregroundColor(CustomColors().light)
                .font(Font.custom("Roboto-Light", size:24))
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(width: 300, height: 2.5, alignment: .center)
                .foregroundColor(.white)
                .background(CustomColors().primeGradiant)
                
        }
    }
}

struct BalanceModule_Previews: PreviewProvider {
    static var previews: some View {
        BalanceModule(viewRouter: ViewRouter())
    }
}
