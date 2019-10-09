//
//  SignUpView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("SYNAPSE")
                Text("WALLET.")
            }.font(.system(size: 60)).foregroundColor(.yellow).offset(x:-60.0, y:00)
            
            Spacer().frame(height: 110)
            
            Text("Sign Up").foregroundColor(.yellow).font(.system(size: 40))
            
            Divider().frame(width: 250).padding(.bottom, 30)
            
            Button(action: {
                self.viewRouter.currentPage = "handle"
                self.viewRouter.method = "local"
            }) {
                    
                Text("Create a Comitatus Account")
            }.frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.yellow)
            .overlay(
               RoundedRectangle(cornerRadius: 40)
                   .stroke(Color.yellow, lineWidth: 2)
                   .padding(.horizontal, 40)
            )
            
            HStack {
                Divider().frame(width: 150).padding(.vertical, 30)
                Text("OR").font(.title).foregroundColor(.yellow)
                Divider().frame(width: 150).padding(.vertical, 30)
            }
            
            Button(action: {
                self.viewRouter.currentPage = "handle"
                self.viewRouter.method = "google"
            }) {
                Text("Login with your Google Account")
            }
             .frame(minWidth: 0, maxWidth: .infinity)
             .padding()
             .foregroundColor(.yellow)
             .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.yellow, lineWidth: 2)
                    .padding(.horizontal, 40)
             )
            
            Spacer().frame(height: 35)
            
            Button(action: {
                self.viewRouter.currentPage = "welcome"
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
            
            Spacer().frame(height: 100)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewRouter: ViewRouter())
    }
}
