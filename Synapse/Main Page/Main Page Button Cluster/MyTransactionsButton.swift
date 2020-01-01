//
//  MyTransactionsButton.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct MyTransactionsButton: View {
    var body: some View {
        Button(action: {}) {
            Text("My Transactions")
            .font(Font.custom("Roboto-Light", size:24))
            .padding()
        }.frame(minWidth: 200, maxWidth: 230)
        .background(CustomColors().lg)
        .cornerRadius(35)
        .padding()
        .foregroundColor(CustomColors().light)
    }
}

struct MyTransactionsButton_Previews: PreviewProvider {
    static var previews: some View {
        MyTransactionsButton()
    }
}


