//
//  CurrencySelector.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct CurrencySelector: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 50) {
                Button(action: {}) {
                    Image("btc")
                        .padding(9)
                }
                .background(CustomColors().lg)
                .foregroundColor(CustomColors().light)
                .mask(Circle())
                
                
                Button(action: {}) {
                    Image("eth")
                        .padding(9)
                }.foregroundColor(CustomColors().lg)
                
                Button(action: {}) {
                    Image("ltc")
                        .padding(9)
                }.foregroundColor(CustomColors().lg)
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector()
    }
}
