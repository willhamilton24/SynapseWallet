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
                VStack(spacing:0) {
                    Image("apple-pay")
                    .resizable()
                    .frame(width: 80, height: 80)
                    
                    Spacer().frame(height: 40)
                }
                .frame(width: 130, height: 130)
                .foregroundColor(.white)
                
                VStack(spacing: 8) {
                    Text("Integration")
                        .font(Font.custom("Roboto-Light", size: 22))
                        .foregroundColor(.white)
                    
//                    Text("Coming Soon!")
//                        .font(Font.custom("Roboto-Light", size: 14))
//                        .foregroundColor(.red)
                    
//                    Image("dot")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(.red)
                }.padding(.top, 30)
            }
        }
        .background(CustomColors().lg)
        .mask(Circle())
        
        
    }
}

struct SwipeToPay_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToPay()
    }
}
