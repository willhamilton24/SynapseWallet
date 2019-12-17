//
//  HandleAndPassword.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct HandleAndPassword: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
//            Text("Welcome Back!")
//            .foregroundColor(Color.white)
//            .font(Font.custom("Roboto-Light", size:48))
//            .padding(.top, 30)
            
            VStack (spacing: 0) {
                 HStack (spacing: 15) {
                    Image("user")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    ZStack(alignment: .leading) {
                        if viewRouter.handle.isEmpty {
                            Text("Handle")
                            .foregroundColor(CustomColors().light)
                            .padding(.leading, 5)
                        }
                        TextField("", text: $viewRouter.handle)
                    }
                    .padding(.vertical)
                    .font(Font.custom("Roboto-Thin", size:24))
                    
                }
                
                Divider()
                    .frame(width: 350, height: 1)
                    .background(Color.white)
                
            }
            .padding(.horizontal, 60)
            
            Spacer().frame(height: 30)
            
            VStack (spacing: 0) {
                HStack (spacing: 15) {
                    Image("key")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    ZStack(alignment: .leading) {
                        if viewRouter.password.isEmpty {
                            Text("Password")
                            .foregroundColor(CustomColors().light)
                            .padding(.leading, 5)
                        }
                        SecureField("", text: $viewRouter.password)
                    }
                    .padding(.vertical)
                    .font(Font.custom("Roboto-Thin", size:24))
                }
                
                Divider()
                    .frame(width: 350, height: 1)
                    .background(Color.white)
                
            }
            .padding(.horizontal, 60)

            

        }
        .foregroundColor(Color.white)
        //.background(CustomColors().primeGradiant)
    }
}

struct HandleAndPassword_Previews: PreviewProvider {
    static var previews: some View {
        HandleAndPassword().environmentObject(ViewRouter())
    }
}
