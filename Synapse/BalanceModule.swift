//
//  BalanceModule.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BalanceModule: View {
    var body: some View {
        
        VStack() {
            Text("Balance") // Balance Label
                .font(.headline)
            Text("321.2113" + " mBTC")
                .font(.system(size: 45))
            Text("$" + "2708.84" + " USD")
                .font(.subheadline)
            Divider().frame(width: 250, height: 20, alignment: .center)
        }
    }
}

struct BalanceModule_Previews: PreviewProvider {
    static var previews: some View {
        BalanceModule()
    }
}
