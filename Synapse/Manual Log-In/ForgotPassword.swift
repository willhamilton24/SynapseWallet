//
//  ForgotPassword.swift
//  Synapse
//
//  Created by Will Hamilton on 10/15/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ForgotPassword: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email: String = ""
    @State private var exists: Bool = false
    
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
                    .frame(height:235)
                    
                    VStack {
                        Text("Forgot Password")
                            .foregroundColor(CustomColors().light)
                            .font(Font.custom("Roboto-Thin", size:30))
                            .padding(.bottom, 20)
                        
                        
                        
                        TextField("  Account Email", text: $email)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                        
                        
                        
                        Text("We'll send a password reset link to your email.")
                            .padding(.horizontal, 50)
                            .font(.custom("Roboto-Thin", size:18))
                            .lineLimit(3)
                            .foregroundColor(CustomColors().light)
                        
                        Spacer()
                            .frame(height: 30)
                        
                    }
                    
                    
                    VStack (spacing: 4) {
                        Button(action: {
                            if (self.viewRouter.emails.contains(self.email.lowercased())) {
                                //self.viewRouter.currentPage = "loading"
                                self.viewRouter.email = self.email
                                NetworkingClient().forgotPassword( email: self.email.lowercased() ) { (json, error) in
                                    if json != nil {
                                        if json == true {
                                            print("Success")
                                            self.viewRouter.currentPage = "forgot-pass-sent"
                                            self.showAlert = true
                                        } else {
                                            print("Failure")
                                            self.viewRouter.currentPage = "email-v"
                                            self.alertTitle = "Could't Send Reset Link"
                                            self.alertText = "Make sure you have validated your email address"
                                        }
                                    } else {
                                        self.alertTitle = "Server Error"
                                        self.alertText = "Noah screwed up, try again in a few minutes"
                                        self.showAlert = true
                                    }
                                }
                            } else {
                                self.alertTitle = "Email Not Registered"
                                self.alertText = "There is no account with that email. Try checking for typos."
                                self.showAlert = true
                            }
                        }) {
                            Text("Next")
                                .padding()
                                .font(Font.custom("Roboto-Thin", size:35))
                                .foregroundColor(CustomColors().light)
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
                            self.viewRouter.currentPage = "welcome"
                        }) {
                            Text("Back")
                                .padding()
                                .font(.custom("Roboto-Thin", size:20))
                                .foregroundColor(CustomColors().light)
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
        .edgesIgnoringSafeArea(.bottom)
        .background(CustomColors().dark)
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword().environmentObject(ViewRouter())
    }
}
