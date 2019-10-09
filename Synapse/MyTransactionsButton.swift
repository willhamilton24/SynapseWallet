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
        }.font(.headline)
             .padding(.all, 12)
             .foregroundColor(.yellow)
             .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.yellow, lineWidth: 2)
            )
    }
}

struct MyTransactionsButton_Previews: PreviewProvider {
    static var previews: some View {
        MyTransactionsButton()
    }
}
