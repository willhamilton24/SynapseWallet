//
//  DepositWithdrawButtun.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct DepositWithdrawButtons: View {
    var body: some View {
        HStack() {
            Button(action: {}) {
               Text("Deposit")
                .font(.headline)
                .padding(.all, 12)
                .foregroundColor(.yellow)
                .overlay(
                   RoundedRectangle(cornerRadius: 40)
                       .stroke(Color.yellow, lineWidth: 2)
               )
            }.frame(width: 120)
            
            Spacer().frame(width: 120)
            
            Button(action: {}) {
               Text("Withdraw")
                .font(.headline)
                .padding(.all, 12)
                .foregroundColor(.yellow)
                .overlay(
                   RoundedRectangle(cornerRadius: 40)
                       .stroke(Color.yellow, lineWidth: 2)
               )
            }.frame(width: 120)
                
        }
    }
}

struct DepositWithdrawButtun_Previews: PreviewProvider {
    static var previews: some View {
        DepositWithdrawButtons()
    }
}
