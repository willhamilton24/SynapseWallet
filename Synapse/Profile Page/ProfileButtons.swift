//
//  ProfileButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfileButtons: View {
    let defaults = UserDefaults.standard
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertText = ""
    
    var body: some View {
        HStack (spacing: 25) {
            Button(action: {
                return NetworkingClient().updateMyProfileInfo(username: self.viewRouter.handle, token: self.viewRouter.token, name: self.viewRouter.profileInfo.name, profilePic: self.viewRouter.profileInfo.profilePic, location: self.viewRouter.profileInfo.location) { (json, error) in
                    print(json)
                    if json! == "user info changed" {
                        print("Profile Updated")
                        self.alertTitle = "Changes Saved"
                        self.alertText = "Your changes have been saved"
                        self.showingAlert = true
                        
                    } else if json! == "invalid username/token"  {
                        self.viewRouter.currentPage = "welcome"
                        self.alertTitle = "Login Invalid"
                        self.alertText = "Something went wrong. Please log back in."
                        self.showingAlert = true
                    } else {
                        self.alertText = "Server Error"
                        self.alertTitle = "Something went wrong. Please try again in a few minutes."
                        self.showingAlert = true

                    }
                }
            }) {
                HStack {
                    Text("Save").font(.custom("Roboto-Thin", size:28))
                    Image("save").resizable().frame(width: 24, height: 24)
                }
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(CustomColors().lg)
            .cornerRadius(25)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
            }
            
            Button(action: {
                self.defaults.set("", forKey: defaultsKeys.handleKey)
                self.defaults.set("", forKey: defaultsKeys.passwordKey)
                self.viewRouter.currentPage = "welcome"
            }) {
                HStack {
                    Text("Logout").font(.custom("Roboto-Thin", size:28))
                    Image("logout2").resizable().frame(width: 24, height: 24)
                }
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(Color.red)
            .cornerRadius(25)
        }
        .foregroundColor(CustomColors().light)
    }
}

struct ProfileButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtons().environmentObject(ViewRouter())
    }
}
