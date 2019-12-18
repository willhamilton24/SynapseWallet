//
//  SetEmailField.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SetEmailField: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack (spacing: 0) {
            Text("Email")
                .font(Font.custom("Roboto-Light", size: 18))
                .foregroundColor(CustomColors().lg)
                .padding(.trailing, 270)

            HStack (spacing: 8) {
               Image("email")
                   .resizable()
                   .frame(width: 28, height: 28)
               
                   ZStack(alignment: .leading) {
                       if viewRouter.email.isEmpty {
                           Text("you@example.com")
                            .foregroundColor(CustomColors().dark)
                            .padding(.leading, 5)
                            .font(Font.custom("Roboto-Thin", size:20))
                       }
                       TextField("", text: $viewRouter.email)
                            .font(Font.custom("Roboto-Thin", size:24))
                   }
                   .padding(.vertical, 5)
               
               
               }.padding(.horizontal, 20)
           
           Divider()
               .frame(width: 320, height: 2)
               .background(CustomColors().dark)
           
        }
    }
}

struct SetEmailField_Previews: PreviewProvider {
    static var previews: some View {
        SetEmailField().environmentObject(ViewRouter())
    }
}
