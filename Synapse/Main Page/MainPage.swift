//
//  MainPage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var btcValue: Double = 0
    
    let screenSize: CGRect = UIScreen.main.bounds

    var body: some View {
            VStack(spacing: 2) {
                    // Top Bar
//                    VStack {
//
//                        Spacer()
//                            .frame(height:165)
//
//                        HStack(spacing: 10.0) {
//
//                            SWLogo()
//
//                            Spacer()
//                                .frame(width: 200, height: 20, alignment: .center)
//
//
//                        }
//                    }
//                    .font(Font.custom("Roboto-Thin", size:36))
//                    .padding()
//                    .padding(.top, 30)
//                    .foregroundColor(CustomColors().light)
//                    .frame(width: 500, height: 270)
//                    .fixedSize()
//                    .background(CustomColors().primeGradiant)
                
                
                    Spacer().frame(width: screenSize.width, height: 200)
                    
                
                    ReloadProfileButtons()
                
                    Spacer().frame(height: 40)
                
                    // Balance Display Cluster
                    if self.viewRouter.coin == "ETH" {
                        BalanceModuleETH().transition(.slide)
                    } else if self.viewRouter.coin == "LTC" {
                        BalanceModuleLTC().transition(.slide)
                    } else if self.viewRouter.coin == "USD" {
                        BalanceModuleUSD().transition(.slide)
                    } else {
                        BalanceModule().transition(.slide)
                    }
                
                    VStack(spacing: 4) {
                        CurrencySelector()  // Select Active Currency
                        DepositWithdrawButtons() // Deposit / Withdraw Funds
                        InstantTransferButton() // Instant Transfer Funds
                        MyTransactionsButton() // Display Account Transaction Log
                    }.padding(.top)
                
                    Spacer().frame(height: 220)
                }
                .edgesIgnoringSafeArea(.all)
                .background(CustomColors().primeGradiant)
                .frame(minWidth: screenSize.width + 10, minHeight: screenSize.height + 80)
                .onAppear {
                    
                    NetworkingClient().getBalances(username: self.viewRouter.handle, token: self.viewRouter.token) { (json, error) in
                        if json != nil {
                            print("Balance Retrieved")
                            if let btc = json!["btc"] as? Double {
                                self.viewRouter.balances.btc = btc
                            }
                            if let eth = json!["eth"] as? Double {
                                self.viewRouter.balances.eth = eth
                            }
                            if let ltc = json!["ltc"] as? Double {
                                self.viewRouter.balances.ltc = ltc
                            }
                            self.viewRouter.currentPage = "main"
                        }
                        
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
            
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(ViewRouter())
    }
}
