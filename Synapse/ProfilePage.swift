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
    
    @State var profileInfo: (name: String?,  email: String, profilePic: String?, joined: Double, balances: (btc: Double, eth: Double, ltc: Double), location: String?) = (name: nil, email: "", profilePic: nil, joined: 5000000000, balances: (btc: 0.0, eth: 0.0, ltc: 0.0), location: nil)
    
    @State private var joinDate: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                PageHeader(viewRouter: viewRouter)
                
                if self.profileInfo.profilePic != nil {
                    //Convert Base64 to Image
                } else {
                    Image("profpic")
                        .resizable()
                        .frame(width: 175, height: 175)
                        .mask(Circle())
                }
                
                VStack (alignment: .leading) {
                    if self.profileInfo.name != nil {
                        // Display Name
                    } else {
                        Text("Name")
                    }
                    
                    Text("@" + self.viewRouter.handle)
                    
                    HStack {
                        Text("Joined " + self.joinDate)
                        
                        if self.profileInfo.location != nil {
                            // Show Location
                        } else {
                            Text("Location")
                        }
                    }
                    
                    
                    HStack {
                        Text(self.profileInfo.email)
                        // Edit Email Button
                    }
                }.foregroundColor(CustomColors().light)
                
                Text("Balances")
                VStack {
                    HStack {
                        Text("BTC")
                        Text(String(self.profileInfo.balances.btc))
                    }
                    HStack {
                        Text("ETH")
                        Text(String(self.profileInfo.balances.eth))
                    }
                    HStack {
                        Text("LTC")
                        Text(String(self.profileInfo.balances.ltc))
                    }
                }
                
                HStack {
                    Button(action: {
                        // Check Altered Fields
                        // Send Requests
                    }) {
                        Text("save")
                    }
                    
                    Button(action: {
                        self.viewRouter.currentPage = "welcome"
                        // Delete Stored Data
                    }) {
                        Text("logout")
                    }
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(CustomColors().dark)
        }
        .onAppear {
            NetworkingClient().getMyProfileInfo(username: self.viewRouter.handle, token: self.viewRouter.token) { (json, error) in
                if error != nil { self.viewRouter.currentPage = "persist"}
                if json != nil {
                    let unwrappedJSON = json!
                    self.profileInfo.email = unwrappedJSON.email!
                    self.profileInfo.joined = unwrappedJSON.joined!
                    self.profileInfo.balances = (btc: unwrappedJSON.balances!["btc"]!, eth: unwrappedJSON.balances!["eth"]!, ltc: unwrappedJSON.balances!["ltc"]!)
                    if unwrappedJSON.name != "" {
                        self.profileInfo.name = unwrappedJSON.name!
                    }
                    if unwrappedJSON.profile_pic != "" {
                        self.profileInfo.profilePic = unwrappedJSON.profile_pic!
                    }
                    if unwrappedJSON.location != nil {
                        self.profileInfo.location = unwrappedJSON.location!
                    }
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .medium
                    dateFormatter.timeStyle = .none
                    
                    dateFormatter.locale = Locale(identifier: "en_US")
                    let joinDateRaw = Date(timeIntervalSince1970: self.profileInfo.joined / 1000)
                    
                    self.joinDate = dateFormatter.string(from: joinDateRaw)
                    print(self.joinDate)
                    
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
