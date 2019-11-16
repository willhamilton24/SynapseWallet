//
//  ProfileButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfileButtons: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack (spacing: 25) {
            Button(action: {
                return NetworkingClient().updateMyProfileInfo(username: self.viewRouter.handle, token: self.viewRouter.token, name: self.viewRouter.profileInfo.name, profilePic: self.viewRouter.profileInfo.profilePic, location: self.viewRouter.profileInfo.location) { (json, error) in
                    print(json)
//                    if json == "user info changed" {
//                        print("Profile Updated")
//                    }
                }
            }) {
                Text("Save").font(.custom("Roboto-Thin", size:28))
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(CustomColors().lg)
            .cornerRadius(25)
            
            Button(action: {}) {
                Text("Logout").font(.custom("Roboto-Thin", size:28))
            }
            .frame(minWidth: 150, minHeight: 60)
            .background(CustomColors().lg)
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
