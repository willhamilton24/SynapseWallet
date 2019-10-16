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
            VStack(alignment: .center, spacing: 0) {
                Image("swipe-up").padding(.bottom, 0)
                Text("PAY").font(.title).padding(.top, 0)
            }.padding(.all, 25)
        }
        .background(Color.yellow)
        .foregroundColor(.white)
        .mask(Circle())
    }
}

struct SwipeToPay_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToPay()
    }
}
