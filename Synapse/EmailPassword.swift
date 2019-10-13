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
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            VStack {
                Spacer().frame(height: 235)
                
                Text("Email & Password").foregroundColor(CustomColors().prime).font(Font.custom("Roboto-Thin", size:30)).padding(.bottom, 20)
                
                
                
                VStack (alignment: .leading) {
                    Text("Email").font(Font.custom("Roboto-Light", size:16)).padding(.vertical, 0).foregroundColor(CustomColors().prime).padding(.horizontal, 30)
                        
                    TextField(" Your Email", text: $email)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                    Spacer().frame(height: 20)
                    
                    Text("Password").font(Font.custom("Roboto-Light", size:16)).padding(.vertical, 0).foregroundColor(CustomColors().prime).padding(.horizontal, 30)
                        
                    SecureField(" Your Password", text: $password)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                    HStack (spacing: 15){
                        if (self.password.count >= 8 && self.password.count <= 24) {
                           Image("dot").resizable().frame(width: 28, height: 28).background(Color.green).cornerRadius(30)
                       } else {
                            Image("dot").resizable().frame(width: 28, height: 28).background(Color.red).cornerRadius(30)
                        }
                        
                        Text("Length: 8-24 Characters").foregroundColor(CustomColors().light)
                        }.padding().padding(.horizontal, 30)
                    //.offset(x: 28, y: 0.0)
                    
                    
                }
                
                Spacer().frame(height: 10)
                
                VStack (spacing: 4) {
                    Button(action: {
                        self.viewRouter.password = self.password
                        self.viewRouter.email = self.email
                        self.viewRouter.currentPage = "terms"
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
                        Text("Back").padding().font(Font.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                    }.frame(minWidth: 225, maxWidth: 250)
                        .background(CustomColors().lg)
                            .cornerRadius(25)
                        .padding()
                        .padding(.vertical, 0)
                            .foregroundColor(CustomColors().light)
                }//.position(x: 210, y:300)
                
                
            }
            
        }.background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
    }
}

struct EmailPassword_Previews: PreviewProvider {
    static var previews: some View {
        EmailPassword(viewRouter: ViewRouter())
    }
}
