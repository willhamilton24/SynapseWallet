//
//  ProfilePage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/24/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var profileInfo: (name: String?,  email: String, profilePic: String?, joined: Int, balances: (btc: Double, eth: Double, ltc: Double), location: String?) = (name: nil, email: "", profilePic: nil, joined: 0, balances: (btc: 0.0, eth: 0.0, ltc: 0.0), location: nil)
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(self.profileInfo.email)
            }
        }.onAppear {
            NetworkingClient().getMyProfileInfo(username: self.viewRouter.handle, token: self.viewRouter.token) { (json, error) in
                if error != nil { self.viewRouter.currentPage = "persist"}
                if json != nil {
                    let unwrappedJSON = json!
                    self.profileInfo.email = unwrappedJSON.email!
                    self.profileInfo.joined = unwrappedJSON.joined!
                    self.profileInfo.balances = (btc: unwrappedJSON.balances!["btc"]!, eth: unwrappedJSON.balances!["eth"]!, ltc: unwrappedJSON.balances!["ltc"]!)
                    if unwrappedJSON.name != nil {
                        self.profileInfo.name = unwrappedJSON.name!
                    }
                    if unwrappedJSON.profile_pic != nil {
                        self.profileInfo.profilePic = unwrappedJSON.profile_pic!
                    }
                    if unwrappedJSON.location != nil {
                        self.profileInfo.location = unwrappedJSON.location!
                    }
                    
                }
            }
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(viewRouter: ViewRouter())
    }
}
