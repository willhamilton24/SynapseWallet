//
//  LoginView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var handle: String = ""
    @State var password: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer().frame(height: 235)
                
                Text("Login").foregroundColor(CustomColors().light).font(Font.custom("Roboto-Thin", size:45))
                
                VStack (alignment: .leading) {
                    Text("Handle").font(Font.custom("Roboto-Light", size:26)).padding(.vertical, 0).foregroundColor(CustomColors().light).padding(.horizontal, 30)
                        
                    TextField(" Your Handle", text: $handle)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                    Spacer().frame(height: 20)
                    
                    Text("Password").font(Font.custom("Roboto-Light", size:26)).padding(.vertical, 0).foregroundColor(CustomColors().light).padding(.horizontal, 30)
                        
                    SecureField(" Your Password", text: $password)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                    
                }
                
                Button(action: {
                    self.viewRouter.currentPage = "forgot-pass"
                }) {
                    Text("Forgot password?")
                }
                
                Spacer().frame(height: 20)
                
                VStack (spacing: 3) {
                    Button(action: {
                        self.viewRouter.handle = self.handle
                        NetworkingClient().login(username: self.handle, password: self.password) { (json, error) in
                            if json != nil {
                                if json == "invalid username/password" {
                                    print("INVALID")
                                    self.alertTitle = "Invalid Handle or Password"
                                    self.alertText = "The Handle or Password was either incorrect or misspelled. Please Try Again."
                                    self.showAlert = true
                                } else if json == "email not verified" {
                                    print("NOT VERIFIED")
                                    self.alertTitle = "Email not Verified"
                                    self.alertText = "You must verify your email before logging in."
                                    self.showAlert = true
                                } else {
                                    self.viewRouter.token = json!
                                    self.viewRouter.currentPage = "main"
                                }
                            }
                        }
                    }) {
                        Text("Login").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .background(CustomColors().lg)
                        .cornerRadius(30)
                    .padding()
                        .foregroundColor(CustomColors().light)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
                    }
                        //.padding(0)
                    
                    Button(action: {
                        self.viewRouter.currentPage = "welcome"
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
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            
        }.background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}