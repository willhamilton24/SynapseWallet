//
//  DepositWithdrawButtun.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct DepositWithdrawButtons: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack() {
            Button(action: {}) {
                HStack(spacing: 0){
                    Text("Deposit ")
                        .font(Font.custom("Roboto-Light", size:20))
                        .padding(.vertical)
                    
                    Image("plus")
                    .resizable()
                    .frame(width: 25, height: 25)
                }
            }
            .frame(width: 130)
            //.background(CustomColors().lg)
            .cornerRadius(20)
            //.padding(.top, 70)
            .foregroundColor(.white)
            
            StablecoinButton()
            
            Button(action: {}) {
                HStack(spacing: 0){
                    Image("minus")
                    .resizable()
                    .frame(width: 25, height: 25)
                    
                    Text(" Withdraw")
                        .font(Font.custom("Roboto-Light", size:20))
                        .padding(.vertical)
                }
            }
            .frame(width: 130)
            //.background(CustomColors().lg)
            .cornerRadius(20)
            //.padding(.top, 70)
            .foregroundColor(.white)
                
        }.padding(.bottom, 0)
    }
}

struct DepositWithdrawButtun_Previews: PreviewProvider {
    static var previews: some View {
        DepositWithdrawButtons().environmentObject(ViewRouter())
    }
}
