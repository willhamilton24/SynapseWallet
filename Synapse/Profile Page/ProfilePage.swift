//
//  ProfilePage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/24/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var profileInfo: (name: String,  email: String, profilePic: String?, joined: Double, balances: (btc: Double, eth: Double, ltc: Double), location: String) = (name: "", email: "example@", profilePic: nil, joined: 0, balances: (btc: 0.0, eth: 0.0, ltc: 0.0), location: "")
    
    @State private var joinDate: String = "Jan 1, 1970"
    
    @State private var defaultName: String = "Anonymous"
    
    @State private var editingName: Bool = false
    @State private var newName: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileHeader()
                
                Spacer().frame(height: 50)
                
                ProfilePicture(profilePic: self.profileInfo.profilePic)
                
                Spacer().frame(height: 30)
                
                VStack (alignment: .leading) {
                    Spacer().frame(width: 400, height: 0)
                    
                    if self.profileInfo.name.isEmpty {
                        EditName(name: "Anonymous")
                    } else {
                        EditName(name: self.profileInfo.name)
                    }
                    
                    
                    ProfileAccountInfo(handle: self.viewRouter.handle, profileInfo: (email: self.profileInfo.email, location: self.profileInfo.location, joinDate: self.joinDate))
                    
                    Spacer().frame(width: 70, height: 0)
                    
//                    VStack {
//                        Text("Balances").font(Font.custom("Roboto-Light", size:20))
//                        
//                        HStack {
//                            Text("BTC").font(Font.custom("Roboto-Light", size:14))
//                            
//                            Text(String(self.profileInfo.balances.btc)).font(Font.custom("Roboto-Thin", size:14))
//                        }
//                        HStack {
//                            Text("ETH").font(Font.custom("Roboto-Light", size:14))
//                            
//                            Text(String(self.profileInfo.balances.eth)).font(Font.custom("Roboto-Thin", size:14))
//                        }
//                        HStack {
//                            Text("LTC").font(Font.custom("Roboto-Light", size:14))
//                            
//                            Text(String(self.profileInfo.balances.ltc)).font(Font.custom("Roboto-Thin", size:14))
//                        }
//                    }
                        
                }.foregroundColor(CustomColors().light)
                
                Spacer().frame(height: 60)
                ProfileButtons()
                Spacer().frame(height: 60)
            
            }
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().dark)
        }
        .edgesIgnoringSafeArea(.vertical)
        .background(CustomColors().dark)
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
        ProfilePage().environmentObject(ViewRouter())
    }
}
