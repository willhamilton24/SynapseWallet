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
            VStack() {
                
                // Top Bar
                HStack(spacing: 10.0) {
                    
                    SWLogo()
                    
                    Spacer().frame(width: 150, height: 20, alignment: .center)
                    
                    
                    //Logout Button
                    Button(action: {}) {
                        Image("logout2")
                    }.foregroundColor(.yellow).background(Color.white)
                        
                }//.offset(x: 0.0, y: -100.0)
                
                Spacer().frame(height: 100)
                
                // Balance Display Cluster
                BalanceModule()//.offset(x: 0.0, y: -30.0)
                
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
                
                // Coin Value Display
                //GraphModule()//.offset(x: 0.0, y: -50.0)
                
               
                
                //Divider().frame(width: 250, height: 20, alignment: .center)
                
                //Spacer().frame(height: 120)
                
                
                
            }.padding().offset(x: 0, y: -50)//.background(Color.blue.edgesIgnoringSafeArea(.all))
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(viewRouter: ViewRouter())
    }
}
