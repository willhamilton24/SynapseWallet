//
//  WelcomePage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct WelcomePage: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var token: String = "Your Handle"
    
    var body: some View {
        ZStack {
            VStack {
                VStack (spacing: 0) {
                    Spacer()
                        .frame(height:180)
                    
                    Text("Welcome")
                        .foregroundColor(CustomColors().light)
                        .font(Font.custom("Roboto-Light", size:60))
                
                    
                    Button(action: {
                        self.viewRouter.currentPage = "login"
                    }) {
                        Text("Login")
                            .padding()
                            .font(Font.custom("Roboto-Thin", size:35))
                            .foregroundColor(CustomColors().light)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .background(CustomColors().lg)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    
                    HStack {
                        
                        Text("OR")
                            .font(Font.custom("Roboto-Light", size: 30))
                            .foregroundColor(CustomColors().light)
                        
                    }
                    
                    Button(action: {
                        self.viewRouter.currentPage = "loading"
                        NetworkingClient().handleArray() { (json, error) in
                            if let error = error {
                                self.viewRouter.users = [error.localizedDescription]
                            } else if let json = json {
                                print(json)
                                self.viewRouter.users = json//.description
                                self.viewRouter.currentPage = "handle"
                            }
                        }
                        
                    }) {
                        Text("Get Started")
                            .padding()
                            .font(Font.custom("Roboto-Thin", size:35))
                            .foregroundColor(CustomColors().light)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(CustomColors().lg)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    
                    Text("Powered by the Comitatus Capital Crypto Platform").font(.subheadline).foregroundColor(CustomColors().light)
                    
                    Button(action: {}) {
                        Text("Learn More")
                            .font(Font.custom("Roboto-Thin", size:20))}
                            .padding(.vertical, 7)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .foregroundColor(CustomColors().prime2)
                }
                .background(CustomColors().dark)
                .edgesIgnoringSafeArea(.bottom)
    
        BigLogo()
            .frame(width: 500, height: 240)
            .position(x: 180, y: 80)
            
        }.background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
        .onAppear {
            let defaults = UserDefaults.standard
            if (defaults.string(forKey: defaultsKeys.handleKey) != nil) {
                self.viewRouter.currentPage = "persist"
            }
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage().environmentObject(ViewRouter())
    }
}
