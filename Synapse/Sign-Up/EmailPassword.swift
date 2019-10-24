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
    @State var showPass: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        ZStack {
            BigLogo()
                .frame(width: 500, height: 240)
                .position(x: 180, y: 80)
            
            VStack {
                Spacer()
                    .frame(height: 235)
                
                Text("Email & Password")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Thin", size:30))
                    .padding(.bottom, 20)
                
                VStack (alignment: .leading) {
                    Text("Email")
                        .font(Font.custom("Roboto-Light", size:16))
                        .padding(.vertical, 0)
                        .foregroundColor(CustomColors().light)
                        .padding(.horizontal, 30)
                        
                    TextField(" Your Email", text: $email)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Password")
                        .font(Font.custom("Roboto-Light", size:16))
                        .padding(.vertical, 0)
                        .foregroundColor(CustomColors().light)
                        .padding(.horizontal, 30)
                    
                    if (self.showPass) {
                        TextField(" Your Password", text: $password)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    } else {
                        SecureField(" Your Password", text: $password)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                        
                    }
                        
                    
                    Toggle(isOn: $showPass) {
                        Text("Show Password?")
                            .font(.custom("Roboto-Lighr", size:20))
                            .foregroundColor(CustomColors().light)
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 30)
                    
                    HStack (spacing: 15) {
                        if (self.password.count >= 8 && self.password.count <= 24) {
                           Image("check")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .background(CustomColors().prime2)
                                .cornerRadius(30)
                                .foregroundColor(CustomColors().light)
                       } else {
                            Image("x")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .background(CustomColors().prime)
                                .cornerRadius(30)
                        }
                        
                        Text("Length: 8-24 Characters")
                            .foregroundColor(CustomColors().light)
                    }
                    .padding(.vertical, 0)
                    .padding(.horizontal, 30)
                }
                
                Spacer()
                    .frame(height: 10)
                
                VStack (spacing: 4) {
                    Button(action: {
                        if self.password.count >= 8 && self.password.count <= 24 {
                            if EmailValidator().isValidEmail(testStr: self.email) {
                                self.viewRouter.password = self.password
                                self.viewRouter.email = self.email
                                self.viewRouter.currentPage = "terms"
                            } else {
                                self.alertTitle = "Email Not Valid"
                                self.alertText = "Please enter a valid email address."
                                self.showAlert = true
                            }
                        } else {
                            self.alertText = "Your password must be between 8 and 24 charaters in length. Please choose a different one."
                            if self.password.count < 4 {
                                self.alertTitle = "Password Too Short"
                            } else {
                                self.alertTitle = "Password Too Long"
                            }
                            self.showAlert = true
                        }
                    }) {
                        Text("Next").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(CustomColors().lg)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
                    }
                    
                    Button(action: {
                        self.viewRouter.currentPage = "keep-logs"
                    }) {
                        Text("Back").padding().font(Font.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                    }
                    .frame(minWidth: 225, maxWidth: 250)
                    .background(CustomColors().lg)
                    .cornerRadius(25)
                    .padding()
                    .padding(.vertical, 0)
                    .foregroundColor(CustomColors().light)
                }
            }
            
        }
        .background(CustomColors().dark)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct EmailPassword_Previews: PreviewProvider {
    static var previews: some View {
        EmailPassword(viewRouter: ViewRouter())
    }
}
