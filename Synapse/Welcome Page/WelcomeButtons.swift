//
//  WelcomeButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct WelcomeButtons: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack (spacing: 0) {
            
            Text("Welcome!")
                .foregroundColor(.white)
                .font(Font.custom("Roboto-Light", size:45))
                .padding(.bottom, 45)
            
            Button(action: {
                self.viewRouter.currentPage = "login"
            }) {
                ZStack {
                    Text("")
                        .frame(minWidth: 0, maxWidth: 350, minHeight: 75)
                        .background(CustomColors().dark)
                        .opacity(0.2)
                        .cornerRadius(20)
                        
                    
                    Text("Sign In")
                        .font(Font.custom("Roboto-Light", size:36))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                }
            }
            .frame(minWidth: 320, maxWidth: 320, minHeight: 65)
            
            HStack {
                Text("")
                    .frame(width: 100, height: 1)
                    .background(Color.white)
                
                Text("OR")
                    .font(Font.custom("Roboto-Light", size: 24))
                    .foregroundColor(.white)
                Text("")
                    .frame(width: 100, height: 1)
                    .background(Color.white)
                
            }
            .padding(.vertical, 30)
            
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
                ZStack {
                    Text("")
                        .frame(minWidth: 0, maxWidth: 350, minHeight: 75)
                        .background(CustomColors().dark)
                        .opacity(0.2)
                        .cornerRadius(20)
                        
                    
                    Text("Get Started")
                        .font(Font.custom("Roboto-Light", size:36))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                }
            }
            .frame(minWidth: 320, maxWidth: 320, minHeight: 65)
            
            Spacer()
            .frame(height:45)
            
            Text("Powered by the Comitatus Capital Crypto Platform")
                .font(Font.custom("Roboto-Thin", size:16))
                .foregroundColor(.white)
                
            
            Button(action: {}) {
                Text("Learn More")
                    .font(Font.custom("Roboto-Light", size:18))
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                    .foregroundColor(CustomColors().lg)
            }
            .edgesIgnoringSafeArea(.trailing)
            .foregroundColor(CustomColors().prime)
        }
        //.background(CustomColors().primeGradiant)
    }
}

struct WelcomeButtons_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeButtons().environmentObject(ViewRouter())
    }
}
