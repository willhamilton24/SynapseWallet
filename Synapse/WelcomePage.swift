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
                .frame(height:70)
                
                VStack (spacing: 0) {
                    Spacer()
                        .frame(height:20)
                    
                    Text("Welcome")
                        .foregroundColor(CustomColors().dark)
                        .font(Font.custom("Roboto-Light", size:55))
                        .padding(.top, 12)
                    
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
                        Text("Login")
                            .padding(.vertical, 8)
                            .font(Font.custom("Roboto-Light", size:35))
                            .foregroundColor(CustomColors().light)
                    }
                    .frame(minWidth: 0, maxWidth: 330)
                    .background(CustomColors().lg)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    
                    HStack {
                        Text("")
                            .frame(width: 100, height: 1)
                            .background(CustomColors().dark)
                        
                        Text("OR")
                            .font(Font.custom("Roboto-Light", size: 24))
                            .foregroundColor(CustomColors().dark)
                        Text("")
                            .frame(width: 100, height: 1)
                            .background(CustomColors().dark)
                        
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
                            .padding(.vertical, 8)
                            .font(Font.custom("Roboto-Light", size:35))
                            .foregroundColor(CustomColors().light)
                    }
                    .frame(minWidth: 0, maxWidth: 330)
                    .background(CustomColors().lg)
                    .cornerRadius(30)
                    .padding()
                    .foregroundColor(CustomColors().light)
                    
                    Spacer()
                    .frame(height:20)
                    
                    Text("Powered by the Comitatus Capital Crypto Platform").font(Font.custom("Roboto-Thin", size:14)).foregroundColor(Color.black)
                        
                    
                    Button(action: {}) {
                        Text("Learn More")
                            .font(Font.custom("Roboto-Light", size:16))
                            .padding(.horizontal, 40)
                            .padding(.bottom, 30)
                    }
                    .edgesIgnoringSafeArea(.trailing)
                    .foregroundColor(CustomColors().prime)
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.bottom)
                .cornerRadius(30)
                .frame(maxWidth: 420)
                .clipped()
                .shadow(color: .gray, radius: 4)
                
                Spacer()
                .frame(height:60)
                
                
                Text("CC LOGO")
                    .font(Font.custom("Roboto-Light", size:60))
                    .foregroundColor(CustomColors().light)
            }.offset(y: -5)
        }
        .padding(.vertical, 30)
        .onAppear {
            let defaults = UserDefaults.standard
            if (defaults.string(forKey: defaultsKeys.handleKey) != nil && defaults.string(forKey: defaultsKeys.handleKey) != "") {
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
