//
//  WelcomePage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct WelcomePage: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            //Spacer().frame(height:20)
            
            BigLogo()
            
            VStack (spacing: 0) {
                Spacer().frame(height:55)
                
                Text("Welcome").foregroundColor(CustomColors().light).font(Font.custom("Roboto-Light", size:60))
                
                Spacer().frame(height:30)
                
                Button(action: {self.viewRouter.currentPage = "login"}) {
                    Text("Login").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().lg)
                    .cornerRadius(30)
                .padding()
                    .foregroundColor(CustomColors().light)
//
//
//
//                .overlay(
//                   RoundedRectangle(cornerRadius: 40)
//                    .stroke(CustomColors().light, lineWidth: 2)
//                       .padding(.horizontal, 40)
//
//                )
                
                HStack {
                    Divider().frame(width: 150).padding(.vertical, 30)
                    Text("OR").font(Font.custom("Roboto-Light", size: 30)).foregroundColor(CustomColors().light)
                    Divider().frame(width: 150).padding(.vertical, 30)
                }
                
                Button(action: {self.viewRouter.currentPage = "handle"}) {
                    Text("Get Started").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().lg)
                    .cornerRadius(30)
                .padding()
                    .foregroundColor(CustomColors().light)
                
                Spacer().frame(height:91)
                 
                
                Text("Powered by the Comitatus Capital Crypto Platform").font(.subheadline).foregroundColor(CustomColors().light)
                
                Button(action: {}) {Text("Learn More").font(Font.custom("Roboto-Thin", size:20))}.padding(.vertical, 7)
                }
                .edgesIgnoringSafeArea(.bottom)
                .foregroundColor(CustomColors().prime2)
            
            Spacer().frame(height: 65)
        }
        .background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage(viewRouter: ViewRouter())
    }
}
