//
//  ProfileAccountInfo.swift
//  Synapse
//
//  Created by Will Hamilton on 10/26/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfileAccountInfo: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var handle: String
    @State var profileInfo = (email: "", location: "", joinDate: "")
    
    @State var defaultLocation = "The Internet, USA"
    
    var body: some View {
        VStack (alignment: .leading) {
        
            EditHandle(handle: self.handle)

            EditEmail(email: self.profileInfo.email)
            
            if !self.profileInfo.location.isEmpty {
                EditLocation(locale: self.profileInfo.location)
            } else {
                EditLocation(locale: self.defaultLocation)
            }
            
            
            Text("Joined: " + self.profileInfo.joinDate)
                .font(Font.custom("Roboto-Light", size:12))
                .padding(.leading, 10)
        }
    }
}

struct ProfileAccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountInfo(handle: "Handle", profileInfo: (email: "email", location: "location", joinDate: "")).environmentObject(ViewRouter())
    }
}
