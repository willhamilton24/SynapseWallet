//
//  CurrencySelector.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct CurrencySelector: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 50) {
                if self.viewRouter.coin == "BTC" {
                    Button(action: {}) {
                        Image("btc").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {self.viewRouter.coin = "BTC"}) {
                        Image("btc").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
                
                
                if self.viewRouter.coin == "ETH" {
                    Button(action: {}) {
                        Image("eth").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {self.viewRouter.coin = "ETH"}) {
                        Image("eth").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
                
                if self.viewRouter.coin == "LTC" {
                    Button(action: {}) {
                        Image("ltc").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {self.viewRouter.coin = "LTC"}) {
                        Image("ltc").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector(viewRouter: ViewRouter())
    }
}
