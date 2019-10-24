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
            NavigationLink(destination: DepositPage()) {
                Text("Deposit")
                    .font(Font.custom("Roboto-Light", size:15))
                    .padding()
            }
            .frame(minWidth: 75, maxWidth: 100)
            .background(CustomColors().lg)
            .cornerRadius(25)
            .padding()
            .padding(.vertical, 0)
            .foregroundColor(CustomColors().light)
            
            //Spacer().frame(width: 100)
            SwipeToPay()
            
            NavigationLink(destination: WithdrawPage()) {
               Text("Withdraw")
                .font(Font.custom("Roboto-Light", size:15))
                .padding()
            }
            .frame(minWidth: 75, maxWidth: 100)
            .background(CustomColors().lg)
            .cornerRadius(25)
            .padding()
            .padding(.vertical, 0)
            .foregroundColor(CustomColors().light)
                
        }
    }
}

struct DepositWithdrawButtun_Previews: PreviewProvider {
    static var previews: some View {
        DepositWithdrawButtons()
    }
}
