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
                
                ProfilePicture(profilePic: self.viewRouter.profileInfo.profilePic)
                
                Spacer().frame(height: 30)
                
                VStack (alignment: .leading) {
                    Spacer().frame(width: 400, height: 0)
                    
                    if self.viewRouter.profileInfo.name.isEmpty {
                        EditName(name: "Anonymous")
                    } else {
                        EditName(name: self.viewRouter.profileInfo.name)
                    }
                    
                    
                    ProfileAccountInfo(handle: self.viewRouter.handle, profileInfo: (email: self.viewRouter.profileInfo.email, location: self.viewRouter.profileInfo.location, joinDate: self.viewRouter.joinDate))
                    
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
        .onAppear {}
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage().environmentObject(ViewRouter())
    }
}
