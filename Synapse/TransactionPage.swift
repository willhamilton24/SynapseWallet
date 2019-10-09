//
//  TransactionPage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct TransactionPage: View {
    var body: some View {
        VStack {
            Text("My Transactions").font(.title)
            Divider()//.padding(.bottom, 30)
            List {
                Text("12/29 @ 8:47AM: -2.3543 mBTC at Starbucks")
                Text("12/29 @ 11:12AM: Deposited 2.0000 ETH")
                Text("12/30 @ 8:42PM: -9.2196 LTC at Nobu")
                Text("1/1 @ 3:32PM: Withdew 9.0000 mBTC")
            }
        }
    }
}

struct TransactionPage_Previews: PreviewProvider {
    static var previews: some View {
        TransactionPage()
    }
}
