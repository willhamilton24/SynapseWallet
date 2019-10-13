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
        ZStack {
            
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            
            VStack {
                Spacer().frame(height: 235)
                
                VStack (alignment: .leading) {
                    Text("Welcome to Synapse,").foregroundColor(CustomColors().light).font(.custom("Roboto-Thin", size:24)).padding(.horizontal, 0)
                    Text("@" + self.viewRouter.handle + ".").font(.custom("Roboto-Light", size:38)).padding(.horizontal, 0).foregroundColor(CustomColors().prime)
                }
                .padding(0)
                .frame(width: 380, alignment: .leading)
                //.offset(x: -70)
                
                
                Spacer().frame(height: 35)
                
                    
                Toggle(isOn: $keepLogsBool) {
                    Text("Store Transaction Logs?").font(.custom("Roboto-Lighr", size:24)).foregroundColor(CustomColors().light)
                }.padding()
                    .padding(.horizontal, 10)
                
                Text("Do you want to keep logs of your transactions?")
                    .padding(.vertical, 0)
                    .foregroundColor(.gray)
                
                Text("Only your account can view these logs.")
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
               Spacer().frame(height: 95)
                
                VStack (spacing: 12) {
                    Button(action: {
                        self.viewRouter.keepLogs = self.keepLogsBool
                        self.viewRouter.currentPage = "email-password"
                    }) {
                        Text("Next").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .background(CustomColors().lg)
                        .cornerRadius(30)
                    .padding()
                        .foregroundColor(CustomColors().light)
                    
                    Button(action: {
                        self.viewRouter.currentPage = "handle"
                    }) {
                        Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                    }.frame(minWidth: 225, maxWidth: 250)
                    .background(CustomColors().lg)
                        .cornerRadius(25)
                    .padding()
                    .padding(.vertical, 0)
                        .foregroundColor(CustomColors().light)
                }//.edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)
                
                
            }//.padding(.horizontal, 20).edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)
            
            
        }.edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)
    }
}

struct SetKeepLogs_Previews: PreviewProvider {
    static var previews: some View {
        SetKeepLogs(viewRouter: ViewRouter())
    }
}
