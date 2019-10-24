//
//  MainPage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    
   @ObservedObject var viewRouter: ViewRouter

    var body: some View {
        NavigationView  {
            VStack(spacing: 0) {
                    
                    // Top Bar
                    VStack {
                        
                        Spacer()
                            .frame(height:125)
                        
                        HStack(spacing: 10.0) {
                            
                            SWLogo()
                            
                            Spacer()
                                .frame(width: 140, height: 20, alignment: .center)
                            
                            //Profile Button
                            NavigationLink(destination: ProfilePage()) {
                                Image("profile")
                                .resizable()
                                .frame(width: 45, height: 45)
                            }
                            
                                
                        }
                    }
                    .font(Font.custom("Roboto-Thin", size:36))
                    .padding()
                    .foregroundColor(CustomColors().light)
                    .frame(width: 500, height: 235)
                    .fixedSize()
                    .background(CustomColors().primeGradiant)
                    
                    Spacer().frame(height: 70)
                    BalanceModule(viewRouter: viewRouter) // Balance Display Cluster
                    MyTransactionsButton().padding(.top, 30) // Display Account Transaction Log
                    CurrencySelector()  // Select Active Currency
                    DepositWithdrawButtons() // Deposit / Withdraw Funds + Pay Button
                    InstantTransferButton() // Instant Transfer Funds
                    Spacer().frame(height: 70)
                    
                    
                    
                }
                .edgesIgnoringSafeArea(.all)
                .background(CustomColors().dark)
            }
            
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(viewRouter: ViewRouter())
    }
}
