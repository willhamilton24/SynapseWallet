//
//  SetKeepLogs.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SetKeepLogs: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var keepLogsBool = true
    
    var body: some View {
        VStack {
            BigLogo()
        
            GettingStartedText()
            
            Spacer().frame(height: 5)
            
            VStack (alignment: .leading) {
                Text("Welcome to Synapse,").foregroundColor(CustomColors().light).font(.custom("Roboto-Thin", size:24)).padding(.horizontal, 0)
                Text("@" + self.viewRouter.handle + ".").font(.custom("Roboto-Light", size:38)).padding(.horizontal, 0).foregroundColor(CustomColors().prime)
            }
            .padding(.horizontal, 0)
            .offset(x: -70)
            
            
            
            
                
            Toggle(isOn: $keepLogsBool) {
                Text("Store Transaction Logs?").font(.custom("Roboto-Lighr", size:27)).foregroundColor(CustomColors().light)
            }.padding()
                .padding(.horizontal, 10)
            
            Text("Do you want to keep logs of your transactions?")
                .padding(.vertical, 0)
                .foregroundColor(.gray)
            
            Text("Only your account can view theese logs.")
                .padding(.vertical, 0)
            .foregroundColor(.gray)
            
            
//            Divider().frame(width: 360, height: 28)
//            
//            if keepLogsBool {
//                Text("Logs Will Be Kept").font(.title).foregroundColor(Color.green)
//            } else {
//                Text("Logs Won't Be Kept").font(.title).foregroundColor(Color.red)
//            }
//
           Spacer().frame(height: 81)
            
            VStack (spacing: 12) {
                Button(action: {
                    self.viewRouter.keepLogs = self.keepLogsBool
                    self.viewRouter.currentPage = "email-password"
                }) {
                    Text("Next").padding().font(.custom("Roboto-Thin", size:30)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().primeGradiant)
                    .cornerRadius(40)
                .padding()
                    .foregroundColor(CustomColors().light)
                    .padding(.vertical, 0)
                
                Button(action: {
                    self.viewRouter.currentPage = "handle"
                }) {
                    Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 225, maxWidth: 250)
                .background(CustomColors().primeGradiant)
                    .cornerRadius(40)
                .padding()
                .padding(.vertical, 0)
                .foregroundColor(CustomColors().light)
        }.edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)

            Spacer().frame(height: 70)
            
            
        }.padding(.horizontal, 0).edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)
    }
}

struct SetKeepLogs_Previews: PreviewProvider {
    static var previews: some View {
        SetKeepLogs(viewRouter: ViewRouter())
    }
}
