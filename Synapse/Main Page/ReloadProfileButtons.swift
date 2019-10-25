//
//  ReloadProfileButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ReloadProfileButtons: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            Button(action: {
                NetworkingClient().getBalances(username: self.viewRouter.handle, token: self.viewRouter.token) { (json2, error) in
                    if json2 != nil {
                        print("Balance Retrieved")
                        if let btc = json2!["btc"] as? Double {
                            self.viewRouter.balances.btc = btc
                        }
                        if let eth = json2!["eth"] as? Double {
                            self.viewRouter.balances.eth = eth
                        }
                        if let ltc = json2!["ltc"] as? Double {
                            self.viewRouter.balances.ltc = ltc
                        }
                        self.viewRouter.currentPage = "main"
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "BTC") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.btc = adjustedPrice
                            self.viewRouter.accountValues.btc = self.viewRouter.prices.btc * self.viewRouter.balances.btc
                            self.viewRouter.accountValues.btc = round(100.0 * self.viewRouter.accountValues.btc) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "ETH") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.eth = adjustedPrice
                            self.viewRouter.accountValues.eth = self.viewRouter.prices.eth * self.viewRouter.balances.eth
                            self.viewRouter.accountValues.eth = round(100.0 * self.viewRouter.accountValues.eth) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "LTC") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.ltc = adjustedPrice
                            self.viewRouter.accountValues.ltc = self.viewRouter.prices.ltc * self.viewRouter.balances.ltc
                            self.viewRouter.accountValues.ltc = round(100.0 * self.viewRouter.accountValues.ltc) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                }
                
            }) {
                Image("reload")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundColor(CustomColors().light)

            }
            
            Spacer().frame(width: 240)
            //Profile Button
            NavigationLink(destination: ProfilePage()) {
                Image("profile")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundColor(CustomColors().light)
            }
        }
    }
}

struct ReloadProfileButtons_Previews: PreviewProvider {
    static var previews: some View {
        ReloadProfileButtons(viewRouter: ViewRouter())
    }
}
