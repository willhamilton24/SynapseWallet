//
//  EmailAndPhoneView.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EmailAndAgeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var birthDate = Date()
    
    var body: some View {
        VStack(spacing:0) {
            Text("Basic Info")
                .font(Font.custom("Roboto-Light", size: 36))
                .foregroundColor(CustomColors().lg)

            Text("Let's get to know each other")
                .font(Font.custom("Roboto-Light", size: 14))
                .frame(width: 325)
           
            Spacer().frame(height: 10)
            
            SetEmailField()
            
            Spacer().frame(height: 25)
            
            Text("Birthday")
            .font(Font.custom("Roboto-Light", size: 18))
            .foregroundColor(CustomColors().lg)
                .padding(.trailing, 250)
           
//           HStack (spacing: 15){
//               if (self.viewRouter.email.count >= 4 && self.viewRouter.email.count <= 24) {
//                  Image("dot-p")
//                   .resizable()
//                   .frame(width: 18, height: 18)
//              } else {
//                   Image("dot-r")
//                   .resizable()
//                   .frame(width: 18, height: 18)
//               }
//
//               Text("Is Valid")
//                   .font(Font.custom("Roboto-Light", size: 18))
//           }.offset(x: -30, y: 0.0).foregroundColor(CustomColors().dark)
//
//           HStack (spacing: 15){
//               if self.viewRouter.users.contains(self.viewRouter.handle.lowercased()) {
//                   Image("dot-r")
//                       .resizable()
//                       .frame(width: 18, height: 18)
//               } else {
//                    Image("dot-p")
//                       .resizable()
//                       .frame(width: 18, height: 18)
//               }
//
//                Text("Is Available").font(Font.custom("Roboto-Light", size: 18))
//           }.offset(x: -15, y: 0.0).foregroundColor(CustomColors().dark)
            
            DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: .date)
            .frame(height: 190)
                .padding(.trailing, 15)
        }.frame(width: 350, height: 350)
    }
}

struct EmailAndAgeView_Previews: PreviewProvider {
    static var previews: some View {
        EmailAndAgeView().environmentObject(ViewRouter())
    }
}
