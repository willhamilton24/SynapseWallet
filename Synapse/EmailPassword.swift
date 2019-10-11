//
//  EmailPassword.swift
//  Synapse
//
//  Created by Will Hamilton on 10/8/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EmailPassword: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            BigLogo()
            
            Spacer().frame(height: 200)
                
            Text("Email").font(.title)
                
            TextField(" Your Email", text: $email)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.yellow, lineWidth: 1)
                            .padding(.horizontal, 25)
                    )
            
                
            Spacer().frame(height: 20)
        
                
            Text("Password").font(.title)
                
            TextField(" Choose a Password", text: $password)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.yellow, lineWidth: 1)
                            .padding(.horizontal, 25)
                    )

            VStack(spacing: 12) {
                Button(action: {
                    self.viewRouter.currentPage = "terms"
                    self.viewRouter.email = "\(self.email)"
                    self.viewRouter.password = "\(self.password)"
                }) {
                    Text("Next").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().lg)
                    .cornerRadius(30)
                .padding()
                    .foregroundColor(CustomColors().light)
                
                Button(action: {
                    self.viewRouter.currentPage = "keep-logs"
                }) {
                    Text("Back")
                }.frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .foregroundColor(.yellow)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.yellow, lineWidth: 2)
                        .padding(.horizontal, 40)
                )
            }.position(x:210, y:210)
            
            
            Spacer().frame(height: 150)
            
            

        }
    }
}

struct EmailPassword_Previews: PreviewProvider {
    static var previews: some View {
        EmailPassword(viewRouter: ViewRouter())
    }
}
