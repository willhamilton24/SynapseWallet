//
//  LoginButton.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        ZStack {
            Button(action: {
                self.viewRouter.handle = self.viewRouter.handle
                NetworkingClient().login(username: self.viewRouter.handle, password: self.viewRouter.password) { (json, error) in
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
                            self.viewRouter.currentPage = "loading"
                            // Save Credentials
                            NetworkingClient().getBalances(username: self.viewRouter.handle, token: self.viewRouter.token) { (json2, error) in
                                if json2 != nil {
                                    if let btc = json2!["btc"] as? Double {
                                        self.viewRouter.balances.btc = btc
                                    }
                                    if let eth = json2!["eth"] as? Double {
                                        self.viewRouter.balances.eth = eth
                                    }
                                    if let ltc = json2!["ltc"] as? Double {
                                        self.viewRouter.balances.ltc = ltc
                                    }
                                    self.viewRouter.currentPage = "main"
                                } else {
                                    self.viewRouter.currentPage = "main"
                                }
                                
                            }
                            
                        }
                    } else {
                        self.alertTitle = "Server Error"
                        self.alertText = "Noah screwed up, try again in a few minutes"
                        self.showAlert = true
                        if error != nil { print(error!) }
                    }
                }
            }) {
                ZStack {
                    Text("")
                        .frame(minWidth: 0, maxWidth: 350, minHeight: 65)
                        .background(CustomColors().dark)
                        .opacity(0.2)
                        .cornerRadius(15)
                        
                    
                    Text("Sign In")
                        .font(Font.custom("Roboto-Light", size:26))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                }
            }
            .frame(minWidth: 350, maxWidth: 350, minHeight: 65)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
            }

        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton().environmentObject(ViewRouter())
    }
}
