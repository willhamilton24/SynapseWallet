//
//  ContentView.swift
//  Synapse
//
//  Created by Will Hamilton on 9/30/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack() {
            
            // Nav Indicator Bar
            NavIndicatorBar().offset(x: 0.0, y: -60.0)
            
            Spacer().frame(height: 20)
            
            // Balance Display Cluster
            BalanceModule()//.offset(x: 0.0, y: -30.0)
            
            Spacer().frame(height: 30)
            
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
            
            
            
        }.padding(100)//.background(Color.blue.edgesIgnoringSafeArea(.all))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
