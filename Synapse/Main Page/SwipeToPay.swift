//
//  SwipeToPay.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SwipeToPay: View {
    var body: some View {
        Button(action: {}) {
            ZStack {
                Image("swipe-up")
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.bottom, 40)
                
                Text("PAY")
                    .font(Font.custom("Roboto-Thin", size:26))
                    .padding(.top, 70)
            }.padding(.all, 10)
        }
        .background(CustomColors().lg)
        .foregroundColor(.white)
        .mask(Circle())
    }
}

struct SwipeToPay_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToPay()
    }
}
