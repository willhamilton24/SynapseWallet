//
//  ProfileAccountInfo.swift
//  Synapse
//
//  Created by Will Hamilton on 10/26/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfileAccountInfo: View {
    @State var handle: String
    @State var profileInfo = (email: "", location: "", joinDate: "")
    
    @State var defaultLocation = "The Internet, USA"
    
    var body: some View {
        VStack (alignment: .leading) {
        
            Text(self.handle)
                .font(Font.custom("Roboto-Thin", size:28))
                .padding(.leading, 10)

            HStack {
                Text(self.profileInfo.email)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .padding(.leading, 10)
                // Edit Email Button
            }
            
            if !self.profileInfo.location.isEmpty {
                Text(self.profileInfo.location)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .padding(.leading, 10)
            } else {
                Text(self.defaultLocation)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .padding(.leading, 10)
            }
            
            
            Text("Joined: " + self.profileInfo.joinDate)
                .font(Font.custom("Roboto-Light", size:12))
                .padding(.leading, 10)
        }
    }
}

struct ProfileAccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountInfo(handle: "Handle", profileInfo: (email: "email", location: "location", joinDate: ""))
    }
}
