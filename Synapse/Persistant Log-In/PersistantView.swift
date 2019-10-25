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
    @ObservedObject var viewRouter: ViewRouter
    
    
    var body: some View {
        ZStack {
            
            BigLogo()
                .frame(width: 500, height: 240)
                .position(x: 180, y: 80)
            
            VStack {
                Spacer()
                   .frame(height: 150)
                
                Text("Welcome Back")
                    .font(Font.custom("Roboto-Light", size:28))
                    .foregroundColor(CustomColors().light)
                
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
                    HStack {
                        Text("Express Login")
                            .font(Font.custom("Roboto-Light", size:40))
                            .padding(.vertical, 20)
                            .padding(.horizontal, 0)
                        
                        Image("Arr-R")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .padding(.horizontal, 0)
                    }
                }
                .frame(minWidth: 0, maxWidth: 350)
                .background(CustomColors().lg)
                .cornerRadius(30)
                .padding()
                .foregroundColor(CustomColors().light)
                
                Button(action: {
                    let defaults = UserDefaults.standard
                    defaults.set(nil, forKey: defaultsKeys.handleKey)
                    defaults.set(nil, forKey: defaultsKeys.passwordKey)
                    self.viewRouter.currentPage = "welcome"
                }) {
                    Text("or login normally")
                }
                .padding()
                
                
                
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
        PersistantView(viewRouter: ViewRouter())
    }
}
