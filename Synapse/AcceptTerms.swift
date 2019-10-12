//
//  AcceptTerms.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import SafariServices


struct AcceptTerms: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var synapseAccept = false
    @State var comitatusAccept = false
    @State var emailAccept = false
    
    
    
    var body: some View {
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            VStack {
                Spacer().frame(height: 235)
                           
                Text("Almost Done...").font(.title).foregroundColor(CustomColors().prime)
                
                Divider()
                
                VStack {
                    Toggle(isOn: $synapseAccept) {
                        VStack {
                            Text("I Have Read & Accepted the Synapse Wallet").foregroundColor(CustomColors().light)
                                .font(.system(size: 15))
                            
                            HStack(spacing: 0) {
                                Button(action: {}) { Text("Terms of Service")}
                                Text(" and ").foregroundColor(CustomColors().light)
                                Button(action: {}) { Text("Privacy Policy")}
                                
                            }
                        }.font(.system(size: 15))
                    }.padding()
                    .padding(.horizontal, 10)
                    
                    Divider()
                    
                    Toggle(isOn: $comitatusAccept) {
                        VStack {
                            Text("I Have Read & Accepted the Comitatus")
                            .font(.system(size: 15)).foregroundColor(CustomColors().light)
                            
                            HStack(spacing: 0) {
                                Button(action: {}) { Text("Terms of Service")}
                                Text(" and ").foregroundColor(CustomColors().light)
                                Button(action: {}) { Text("Privacy Policy")}
                                
                            }
                        }.font(.system(size: 15))
                    }.padding()
                    .padding(.horizontal, 10)
                    
                    Divider()
                    
                    Toggle(isOn: $emailAccept) {
                        Text("I Would Like Synapse to Email Me About Crypto").font(.system(size: 13)).foregroundColor(CustomColors().light)
                    }.padding()
                    .padding(.horizontal, 10)
                    
                    Divider()
                    
                    
                    if self.viewRouter.method == "google" {
                        Button(action: {
                            self.viewRouter.currentPage = "google"
                        }) {
                            HStack {
                                Text("Connect with your Google Account")
                                Image("google").resizable().frame(width: 20, height: 20)
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.yellow)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.yellow, lineWidth: 2)
                                .padding(.horizontal, 40)
                            )
                    } else {
                        Button(action: {
                            self.viewRouter.currentPage = "loading"
                            NetworkingClient().registerUser(username: self.viewRouter.handle, password: self.viewRouter.password, email: self.viewRouter.email, saveLogs: self.viewRouter.keepLogs, receiveEmails: self.emailAccept) { (json, error) in
                                if let error = error {
                                    print(error)
                                    //self.viewRouter.token = error.localizedDescription
                                } else if let json = json {
                                    print(json)
                                    if json == "user created" {
                                        NetworkingClient().login(username: self.viewRouter.handle, password: self.viewRouter.password) { (json2, error2) in
                                                if let error2 = error2 {
                                                    print(error2)
                                                    self.viewRouter.token = error2.localizedDescription
                                                } else if let json2 = json2 {
                                                    print(json2)
                                                    self.viewRouter.token = json2
                                                    self.viewRouter.currentPage = "main"
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }) {
                            Text("Sign Up").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .background(CustomColors().lg)
                            .cornerRadius(30)
                        .padding()
                            .foregroundColor(CustomColors().light)
                    }
                    
                    Button(action: {
                        self.viewRouter.currentPage = "email-password"
                    }) {
                        Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                    }.frame(minWidth: 225, maxWidth: 250)
                        .background(CustomColors().lg)
                            .cornerRadius(25)
                        .padding()
                        .padding(.vertical, 0)
                            .foregroundColor(CustomColors().light)
                    
                    
                }
            }
            
        }.background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
    }
}

struct AcceptTerms_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTerms(viewRouter: ViewRouter())
    }
}
