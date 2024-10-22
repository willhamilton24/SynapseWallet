//
//  SetKeepLogs.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SetKeepLogs: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var keepLogsBool = true
    
    var body: some View {
        ZStack {
            BigLogo()
                .frame(width: 500, height: 240)
                .position(x: 180, y: 80)
            
            VStack {
                Spacer()
                    .frame(height: 235)
                
                VStack (alignment: .leading) {
                    Text("Welcome to Synapse,")
                        .foregroundColor(CustomColors().light)
                        .font(.custom("Roboto-Thin", size:30))
                        .padding(.horizontal, 0)
                    Text("@" + self.viewRouter.handle + ".")
                        .font(.custom("Roboto-Light", size:38))
                        .padding(.horizontal, 0)
                        .foregroundColor(CustomColors().prime)
                }
                .padding(0)
                
                
                Spacer().frame(height: 35)
                
                    
                Toggle(isOn: $keepLogsBool) {
                    Text("Store Transaction Logs?")
                        .font(.custom("Roboto-Lighr", size:24))
                        .foregroundColor(CustomColors().light)
                }
                .padding()
                .padding(.horizontal, 10)
                
                Text("Do you want to keep logs of your transactions?")
                    .padding(.vertical, 0)
                    .foregroundColor(.gray)
                
                Text("Only your account can view these logs.")
                    .padding(.vertical, 0)
                    .foregroundColor(.gray)
                
               Spacer()
                .frame(height: 95)
                
                VStack (spacing: 4) {
                    Button(action: {
                        self.viewRouter.keepLogs = self.keepLogsBool
                        self.viewRouter.currentPage = "email-password"
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
                    
                    BackButton(destination: "handle")
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(CustomColors().dark)
    }
}

struct SetKeepLogs_Previews: PreviewProvider {
    static var previews: some View {
        SetKeepLogs().environmentObject(ViewRouter())
    }
}
