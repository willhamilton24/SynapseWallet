//
//  ProfilePicture.swift
//  Synapse
//
//  Created by Will Hamilton on 10/26/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfilePicture: View {
    
    @State var profilePic: String?
    
    var body: some View {
        VStack {
            if self.profilePic != nil {
                //Convert Base64 to Image
                Image("profpic")
                .resizable()
                .frame(width: 230, height: 230)
                .mask(Circle())
            } else {
                Image("profpic")
                    .resizable()
                    .frame(width: 230, height: 230)
                    .mask(Circle())
            }
            Button(action: {}) {
                Text("Change Profile Picture")
            }
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(profilePic: nil)
    }
}
