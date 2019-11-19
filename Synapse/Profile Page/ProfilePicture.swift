//
//  ProfilePicture.swift
//  Synapse
//
//  Created by Will Hamilton on 10/26/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ProfilePicture: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var showingSheet = false
    @State var profilePic: String?
    
    @State var showCaptureImageView: Bool  = false
    @State var image: Image? = nil
    
    var body: some View {
        ZStack {
            VStack {
                if self.image != nil {
                    //Convert Base64 to Image
                    image!
                        .resizable()
                        .frame(width: 230, height: 230)
                        .mask(Circle())
                } else {
                    Image("profpic")
                        .resizable()
                        .frame(width: 230, height: 230)
                        .mask(Circle())
                }
                Button(action: {
                    self.showingSheet = true
                }) {
                    Text("Change Profile Picture")
                }.actionSheet(isPresented: $showingSheet) {
                    ActionSheet(title: Text("Change Profile Page"), buttons: [ .default(Text("Take Photo with Camera"), action: {}), .default(Text("Choose Photo From Camera Roll"), action: {self.showCaptureImageView.toggle()}),
                        .destructive(Text("Cancel").foregroundColor(Color.red))])
                }
            }
            if (showCaptureImageView) {
                VStack {
                    Spacer().frame(height: 360)
                    CaptureImageView(isShown: $showCaptureImageView, image: $image).frame(width: 410, height: 900)
                }.background(CustomColors().light2) // TODO: Change to Match
            }
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(profilePic: nil)
    }
}
