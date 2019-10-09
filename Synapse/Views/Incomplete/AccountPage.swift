//
//  AccountPage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct AccountPage: View {
    var body: some View {
        NavigationView {
            VStack() {
                Image("profpic").resizable().frame(width: 250, height: 250).mask(Circle())
                Text("Will Hamilton").font(.title)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 7) {
                    Spacer().frame(height: 20)
                    Text("Membership Status: " + "Black Card Elite").font(.headline)
                    Text("Member Since: " + "January 1st, 2020").font(.subheadline)
                    Text("Total Approximate Wallet Value: " + "$" + "7732.21" + " USD").font(.subheadline)
                    Spacer().frame(height: 20)
                }.padding(0)
                
                // Content
                    // Wallet Breakdown
                
                    
                    // Transaction Logs
                    // Crypto Info
                    // Credits
                
                
                
                
            }.offset(x: 0.0, y: -150.0)
            
        }
    }
}

struct AccountPage_Previews: PreviewProvider {
    static var previews: some View {
        AccountPage()
    }
}
