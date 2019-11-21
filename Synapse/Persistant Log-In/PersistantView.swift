//
//  PersistantView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/12/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//
import LocalAuthentication
import SwiftUI

struct PersistantView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Text("")
            .frame(minWidth: screenSize.width, minHeight: screenSize.height + 80)
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().primeGradiant)
            
            VStack {
                BigLogo()
                .frame(width: 500, height: 240)
                .offset(x: -30)
                
                Spacer()
                   .frame(height: 95)
                
                VStack {
                    Text("Welcome Back!")
                        .font(Font.custom("Roboto-Light", size:36))
                        .foregroundColor(CustomColors().dark)
                        .padding(.top, 30)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        BiometricAuth().authenticateTapped() { didWork in
                            if didWork {
                                self.viewRouter.currentPage = "loading"
                                let defaults = UserDefaults.standard
                                NetworkingClient().login(
                                username: defaults.string(forKey: defaultsKeys.handleKey)!,
                                password: defaults.string(forKey: defaultsKeys.passwordKey)!) { (json, error) in
                                    if json != nil {
                                        if json == "invalid username/password" {
                                            print("INVALID")
                                        } else {
                                            self.viewRouter.handle = defaults.string(forKey: defaultsKeys.handleKey)!
                                            self.viewRouter.token = json!
                                            self.viewRouter.currentPage = "loading"
                                            NetworkingClient().getBalances(username: defaults.string(forKey: defaultsKeys.handleKey)!, token: self.viewRouter.token) { (json2, error) in
                                                if json2 != nil {
                                                    print("Balance Retrieved")
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
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                print("Try again or login normally")
                            }
                        }
                    }) {
                        VStack (spacing:0) {
                            Image("faceid")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding(.top, 5)
                                .padding(.horizontal, 0)
                            Text("Login with FaceID")
                                .font(Font.custom("Roboto-Light", size:24))
                                .padding(.top, 0)
                                .padding(.bottom, 15)
                                .padding(.horizontal, 0)
                        }.padding(.vertical, 10)
                    }
                    .frame(minWidth: 0, maxWidth: 210)
                    .background(CustomColors().lg)
                    .cornerRadius(15)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    .clipped()
                    .shadow(color: .gray, radius: 4)
                    
                    Button(action: {
                        let defaults = UserDefaults.standard
                        defaults.set(nil, forKey: defaultsKeys.handleKey)
                        defaults.set(nil, forKey: defaultsKeys.passwordKey)
                        self.viewRouter.currentPage = "welcome"
                    }) {
                        Text("..or login normally").foregroundColor(CustomColors().lg)
                    }.padding(.bottom, 30)
                }
                .background(Color.white)
                .cornerRadius(30)
                .frame(maxWidth: 420)
                .clipped()
                .shadow(color: .gray, radius: 8)
                
                Spacer()
                .frame(height:180)
            }
        }.onAppear {
            BiometricAuth().authenticateTapped() { didWork in
                if didWork {
                    // Login
                    let defaults = UserDefaults.standard
                    NetworkingClient().login(
                    username: defaults.string(forKey: defaultsKeys.handleKey)!,
                    password: defaults.string(forKey: defaultsKeys.passwordKey)!) { (json, error) in
                        if json != nil {
                            if json == "invalid username/password" {
                                print("INVALID")
                            } else {
                                self.viewRouter.token = json!
                                self.viewRouter.currentPage = "main"
                            }
                        }
                    }
                    self.viewRouter.currentPage = "main"
                } else {
                    print("Try again or login normally")
                }
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(CustomColors().dark)

    }
}

struct PersistantView_Previews: PreviewProvider {
    static var previews: some View {
        PersistantView().environmentObject(ViewRouter())
    }
}
