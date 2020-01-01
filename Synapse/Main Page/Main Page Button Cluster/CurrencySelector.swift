//
//  CurrencySelector.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct CurrencySelector: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 50) {
                if self.viewRouter.coin == "BTC" {
                    Button(action: {
                        CoinbaseMarketData().getQuote(currency: "BTC") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.btc = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                    }) {
                        Image("btc").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {
                        self.viewRouter.coin = "BTC"
                        CoinbaseMarketData().getQuote(currency: "BTC") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.btc = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                    }) {
                        Image("btc").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
                
                
                if self.viewRouter.coin == "ETH" {
                    Button(action: {
                        CoinbaseMarketData().getQuote(currency: "ETH") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.eth = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                    }) {
                        Image("eth").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {
                        self.viewRouter.coin = "ETH"
                        CoinbaseMarketData().getQuote(currency: "ETH") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.eth = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                        
                    }) {
                        Image("eth").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
                
                if self.viewRouter.coin == "LTC" {
                    Button(action: {
                        CoinbaseMarketData().getQuote(currency: "LTC") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.ltc = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                    }) {
                        Image("ltc").padding(9)
                    }
                    .background(CustomColors().lg)
                    .foregroundColor(CustomColors().light)
                    .mask(Circle())
                } else {
                    Button(action: {
                        self.viewRouter.coin = "LTC"
                        CoinbaseMarketData().getQuote(currency: "LTC") { (price, error) in
                            if error != nil {
                                print(error)
                            } else if price != nil {
                                let adjustedPrice = price! * 0.97
                                self.viewRouter.prices.ltc = adjustedPrice
                            } else {
                                print("no dice")
                            }
                        }
                        
                    }) {
                        Image("ltc").padding(9)
                    }.foregroundColor(CustomColors().lg)
                }
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector().environmentObject(ViewRouter())
    }
}
