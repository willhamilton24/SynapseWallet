//
//  LoginView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var handle: String = ""
    @State var password: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            
            Text("")
            .frame(minWidth: screenSize.width, minHeight: screenSize.height + 120)
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().primeGradiant)
            
            VStack {
                BigLogo()
                .frame(width: 500, height: 240)
                .offset(x: -30)
                
                Spacer().frame(height: 65)
                
                VStack {
                    Text("Welcome Back!")
                        .foregroundColor(CustomColors().dark)
                        .font(Font.custom("Roboto-Thin", size:48))
                        .padding(.top, 30)
                        .padding(.bottom, 8)
                    
                    Text("")
                        .frame(width: 300, height: 1)
                        .background(CustomColors().dark)
                        .padding(.bottom, 25)
                    
                    VStack (alignment: .leading) {
                        Text("Handle")
                            .font(Font.custom("Roboto-Light", size:26))
                            .padding(.vertical, 0)
                            .foregroundColor(CustomColors().dark)
                            .padding(.horizontal, 20)
                            
                        TextField(" Your Handle", text: $handle)
                                .padding(.horizontal, 20)
                                .padding(.vertical)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                        .padding(.horizontal, 20)
                                ).foregroundColor(CustomColors().dark)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("Password")
                            .foregroundColor(CustomColors().dark)
                            .font(Font.custom("Roboto-Light", size:26))
                            .padding(.vertical, 0)
                            .padding(.horizontal, 20)
                            
                        SecureField(" Your Password", text: $password)
                                .padding(.horizontal, 20)
                                .padding(.vertical)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                        .padding(.horizontal, 20)
                        ).foregroundColor(CustomColors().dark)
                        
                        
                    }
                    
                    Button(action: {
                        self.viewRouter.currentPage = "loading"
                        NetworkingClient().emailArray() { (json, error) in
                            if let error = error {
                                self.viewRouter.emails = [error.localizedDescription]
                            } else if let json = json {
                                print(json)
                                self.viewRouter.emails = json
                                self.viewRouter.currentPage = "forgot-pass"
                            }
                        }
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
                                        self.viewRouter.currentPage = "loading"
                                        // Save Credentials
                                        NetworkingClient().getBalances(username: self.handle, token: self.viewRouter.token) { (json2, error) in
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
                            Text("Login")
                                .font(Font.custom("Roboto-Thin", size:35))
                                .foregroundColor(CustomColors().light)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8)
                        }
                        .frame(minWidth: 0, maxWidth: 200)
                        .background(CustomColors().lg)
                        .cornerRadius(30)
                        .foregroundColor(CustomColors().light)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
                        }
                        
                        BackButton(destination: "welcome")
                    }
                }
                .background(Color.white)
                .frame(maxWidth: 380)
                .cornerRadius(30)
                .clipped()
                .shadow(color: .gray, radius: 4)
                

                
                //Spacer().frame(height: 50)
                
                
            }
            
        }
        .background(CustomColors().dark)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(ViewRouter())
    }
}
