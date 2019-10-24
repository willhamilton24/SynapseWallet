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
        NavigationLink(destination: TransactionPage()) {
            Text("My Transactions")
            .font(Font.custom("Roboto-Light", size:16))
            .padding()
        }.frame(minWidth: 125, maxWidth: 150)
        .background(CustomColors().lg)
        .cornerRadius(25)
        .padding()
        .padding(.vertical, 0)
        .foregroundColor(CustomColors().light)
    }
}

struct MyTransactionsButton_Previews: PreviewProvider {
    static var previews: some View {
        MyTransactionsButton()
    }
}


