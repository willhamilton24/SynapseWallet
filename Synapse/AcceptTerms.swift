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
        VStack {
            BigLogo()
                       
            Spacer().frame(height: 120)
                       
            Text("Almost Done...").font(.title).foregroundColor(.yellow)
            
            Divider()
            
            VStack {
                Toggle(isOn: $synapseAccept) {
                    VStack {
                        Text("I Have Read & Accepted the Synapse Wallet")
                        .font(.system(size: 15))
                        
                        HStack(spacing: 0) {
                            Button(action: {}) { Text("Terms of Service")}
                            Text(" and ")
                            Button(action: {}) { Text("Privacy Policy")}
                            
                        }
                    }.font(.system(size: 15))
                }.padding()
                .padding(.horizontal, 10)
                
                Divider()
                
                Toggle(isOn: $comitatusAccept) {
                    VStack {
                        Text("I Have Read & Accepted the Comitatus")
                        .font(.system(size: 15))
                        
                        HStack(spacing: 0) {
                            Button(action: {}) { Text("Terms of Service")}
                            Text(" and ")
                            Button(action: {}) { Text("Privacy Policy")}
                            
                        }
                    }.font(.system(size: 15))
                }.padding()
                .padding(.horizontal, 10)
                
                Divider()
                
                Toggle(isOn: $emailAccept) {
                    Text("I Would Like Synapse to Email Me About Crypto").font(.system(size: 13))
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
                        self.viewRouter.currentPage = "main"
                    }) {
                        Text("Go To Wallet")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.yellow)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.yellow, lineWidth: 2)
                            .padding(.horizontal, 40)
                    )
                }
                
                Button(action: {
                    self.viewRouter.currentPage = "email-password"
                }) {
                    Text("Back")
                }.frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .foregroundColor(.yellow)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.yellow, lineWidth: 2)
                        .padding(.horizontal, 40)
                )
                
                
            }
        }
    }
}

struct AcceptTerms_Previews: PreviewProvider {
    static var previews: some View {
        AcceptTerms(viewRouter: ViewRouter())
    }
}
