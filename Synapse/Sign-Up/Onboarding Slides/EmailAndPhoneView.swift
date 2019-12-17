//
//  EmailAndPhoneView.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EmailAndPhoneView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Email & Phone")
                .font(Font.custom("Roboto-Light", size: 36))
                .foregroundColor(CustomColors().lg)
                

            Text("Let's get to know each other")
                .font(Font.custom("Roboto-Light", size: 14))
                .frame(width: 325)
            
            VStack (spacing: 0) {
                            HStack (spacing: 8) {
                               Image("email")
                                   .resizable()
                                   .frame(width: 28, height: 28)
                               
                               ZStack(alignment: .leading) {
                                   if viewRouter.email.isEmpty {
                                       Text("Email")
                                       .foregroundColor(CustomColors().dark)
                                       .padding(.leading, 5)
                                   }
                                   TextField("", text: $viewRouter.email)
                               }
                               .padding(.vertical, 5)
                               .font(Font.custom("Roboto-Thin", size:24))
                               
                               }.padding(.horizontal, 20)
                           
                           Divider()
                               .frame(width: 320, height: 1)
                               .background(CustomColors().dark)
                           
                       }
                       
                       Spacer().frame(height: 25)
                       
                       HStack (spacing: 15){
                           if (self.viewRouter.email.count >= 4 && self.viewRouter.email.count <= 24) {
                              Image("dot-p")
                               .resizable()
                               .frame(width: 18, height: 18)
                          } else {
                               Image("dot-r")
                               .resizable()
                               .frame(width: 18, height: 18)
                           }
                           
                           Text("Is Valid")
                               .font(Font.custom("Roboto-Light", size: 18))
                       }.offset(x: -30, y: 0.0).foregroundColor(CustomColors().dark)
                       
                       HStack (spacing: 15){
                           if self.viewRouter.users.contains(self.viewRouter.handle.lowercased()) {
                               Image("dot-r")
                                   .resizable()
                                   .frame(width: 18, height: 18)
                           } else {
                                Image("dot-p")
                                   .resizable()
                                   .frame(width: 18, height: 18)
                           }
                            
                            Text("Is Available").font(Font.custom("Roboto-Light", size: 18))
                       }.offset(x: -15, y: 0.0).foregroundColor(CustomColors().dark)
            
            
            VStack (spacing: 0) {
                            HStack (spacing: 8) {
                               Image("phone")
                                   .resizable()
                                   .frame(width: 28, height: 28)
                               
                               ZStack(alignment: .leading) {
                                   if viewRouter.phone.isEmpty {
                                       Text("Phone")
                                       .foregroundColor(CustomColors().dark)
                                       .padding(.leading, 5)
                                   }
                                   TextField("", text: $viewRouter.phone)
                               }
                               .padding(.vertical, 5)
                               .font(Font.custom("Roboto-Thin", size:24))
                               
                               }.padding(.horizontal, 20)
                           
                           Divider()
                               .frame(width: 320, height: 1)
                               .background(CustomColors().dark)
                           
                       }
                       
                       Spacer().frame(height: 25)
                       
                       HStack (spacing: 15){
                           if (self.viewRouter.phone.count >= 4 && self.viewRouter.phone.count <= 24) {
                              Image("dot-p")
                               .resizable()
                               .frame(width: 18, height: 18)
                          } else {
                               Image("dot-r")
                               .resizable()
                               .frame(width: 18, height: 18)
                           }
                           
                           Text("Is Valid")
                               .font(Font.custom("Roboto-Light", size: 18))
                       }.offset(x: -30, y: 0.0).foregroundColor(CustomColors().dark)
                       
                       HStack (spacing: 15){
                           if self.viewRouter.users.contains(self.viewRouter.handle.lowercased()) {
                               Image("dot-r")
                                   .resizable()
                                   .frame(width: 18, height: 18)
                           } else {
                                Image("dot-p")
                                   .resizable()
                                   .frame(width: 18, height: 18)
                           }
                            
                            Text("Is Available").font(Font.custom("Roboto-Light", size: 18))
                       }.offset(x: -15, y: 0.0).foregroundColor(CustomColors().dark)
        }.frame(width: 350, height: 350)
    }
}

struct EmailAndPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        EmailAndPhoneView().environmentObject(ViewRouter())
    }
}
