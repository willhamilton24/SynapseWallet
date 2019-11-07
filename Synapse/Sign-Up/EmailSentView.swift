//
//  EmailSentView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/12/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EmailSentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        
        ZStack {
            
            BigLogo()
                .frame(width: 500, height: 240)
                .position(x: 180, y: 80)
            
            VStack {
                
                Spacer()
                    .frame(height: 235)
                
                Image("mail")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .padding(.bottom, 50)
                
                Text("Account Created")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Light", size:30))
                Text("Verify your Email to Log In")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Thin", size:22))
                    .padding(.bottom, 20)
                
                VStack (spacing: 0) {
                    Text("We have sent a verification email to")
                    Text(self.viewRouter.email)
                }
                .foregroundColor(CustomColors().light)
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    //self.viewRouter.currentPage = "loading"
                    NetworkingClient().login(username: self.viewRouter.handle, password: self.viewRouter.password) { (json, error) in
                        if json != nil {
                            if json == "email not verified" {
                                print("NOT VERIFIED")
                                self.viewRouter.currentPage = "email-v"
                                self.alertTitle = "Email not Verified"
                                self.alertText = "You must verify your email before logging in."
                                self.showAlert = true
                            } else {
                                self.viewRouter.token = json!
                                self.viewRouter.currentPage = "main"
                            }
                        } else {
                            self.alertTitle = "Server Error"
                            self.alertText = "Noah screwed up, try again in a few minutes"
                            self.showAlert = true
                        }
                    }
                }) {
                    Text("I'm Verified, Log Me In!").padding().font(Font.custom("Roboto-Thin", size:32)).foregroundColor(CustomColors().light)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().lg)
                .cornerRadius(30)
                .padding()
                .foregroundColor(CustomColors().light)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
                }
            }
        }
        .background(CustomColors().dark)
        .edgesIgnoringSafeArea(.bottom) 
    }
}

struct EmailSentView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSentView().environmentObject(ViewRouter())
    }
}
