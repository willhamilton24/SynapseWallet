//
//  LoginView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var handle: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Login").font(.title).foregroundColor(.yellow)
            
            Text("Handle").font(.title)
                
            TextField(" Your Handle", text: $handle)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.yellow, lineWidth: 1)
                            .padding(.horizontal, 25)
                    )
            
            Text("Password").font(.title)
                
            TextField(" Your Password", text: $password)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.yellow, lineWidth: 1)
                            .padding(.horizontal, 25)
                    )
            
            VStack (spacing: 12) {
                Button(action: {
                    //self.viewRouter.currentPage = "keep-logs"
                    self.viewRouter.handle = self.handle
                    NetworkingClient().login(username: self.handle, password: self.password) { (json, error) in
                        if json != nil {
                            if json == "invalid username/password" {
                                print("INVALID")
                            } else {
                                self.viewRouter.token = json!
                                self.viewRouter.currentPage = "main"
                            }
                        }
                    }
                }) {
                    Text("Login").padding().font(.custom("Roboto-Thin", size:30)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().primeGradiant)
                    .cornerRadius(40)
                .padding()
                    .foregroundColor(CustomColors().light)
                    .padding(.vertical, 0)
                
                Button(action: {
                    self.viewRouter.currentPage = "welcome"
                }) {
                    Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                }.frame(minWidth: 225, maxWidth: 250)
                    .background(CustomColors().primeGradiant)
                        .cornerRadius(40)
                    .padding()
                    .padding(.vertical, 0)
                        .foregroundColor(CustomColors().light)
            }//.position(x: 210, y:300)
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}
