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
                            .frame(height:100)
                        HStack(spacing: 10.0) {
                            
                            SWLogo()
                            
                            Spacer()
                                .frame(width: 140, height: 20, alignment: .center)
                            
                            //Profile Button
                            NavigationLink(destination: ProfilePage()) {
                                Image("profile")
                                .resizable()
                                .frame(width: 65, height: 65)
                            }
                            
                                
                        }
                    }
                    .font(Font.custom("Roboto-Thin", size:36))
                    .padding()
                    .foregroundColor(CustomColors().light)
                    .frame(width: 500, height: 235)
                    .fixedSize()
                    .background(CustomColors().primeGradiant)
                    .edgesIgnoringSafeArea(.top)
                    
                    
                    
                    // Balance Display Cluster
                    BalanceModule()
                    
                    //Spacer().frame(height: 40)
                    
                    MyTransactionsButton().padding(.top, 30)
                
                    Spacer().frame(height: 20)
                    
                    // Select Active Currency
                    CurrencySelector()//.offset(x: 0.0, y: -30.0)
                               
                    SwipeToPay()
                    
                    // Deposit / Withdraw Funds
                    DepositWithdrawButtons()
                    
                    Spacer().frame(height: 20)
                    
                    // Instant Transfer Funds
                    InstantTransferButton()
        
                    
                    Spacer().frame(height: 120)
                    
                    
                    
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(CustomColors().dark)
            }
            
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(viewRouter: ViewRouter())
    }
}
