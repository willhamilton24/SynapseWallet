//
//  SetPasswordView.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SetPasswordView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var confirmPassword: String = ""
    
    var body: some View {
//            VStack(spacing: 20) {
//            Text("Choose Password")
//                .font(Font.custom("Roboto-Light", size: 36))
//                .foregroundColor(CustomColors().lg)
//            VStack(alignment: .leading) {
//                Text("Password").font(Font.custom("Roboto-Thin", size:18))
//                SecureField("", text: $viewRouter.password)
//                    .frame(width: 320)
//                    .font(Font.custom("Roboto-Thin", size:24))
//                Divider()
//                    .frame(width: 320, height: 1.5)
//                    .background(CustomColors().dark)
//                    .padding(.bottom)
//
//                Text("Confirm Password").font(Font.custom("Roboto-Thin", size:18))
//                SecureField("", text: $confirmPassword)
//                    .frame(width: 320)
//                    .font(Font.custom("Roboto-Thin", size:24))
//                Divider()
//                    .frame(width: 320, height: 1.5)
//                    .background(CustomColors().dark)
//            }
//            .frame(width: 320)
//        }
        Text("Set Password")
    }
}

struct SetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView().environmentObject(ViewRouter())
    }
}
