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
            VStack {
                Spacer().frame(height: 20)
                
                ProfileHeader()
                
                Spacer().frame(height: 30)
                
                ProfilePicture()
                
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
                }.foregroundColor(CustomColors().light)
                
                Spacer().frame(height: 80)
                ProfileButtons().padding(.bottom, 20)
                
                
                Button(action: {self.viewRouter.currentPage = "credits"}) {
                    Text("Legal & Credits")
                }
                Spacer().frame(height: 20)
                
            
            }
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().dark)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage().environmentObject(ViewRouter())
    }
}
