//
//  ProfilePicture.swift
//  Synapse
//
//  Created by Will Hamilton on 10/26/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import UIKit

struct ProfilePicture: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var showingSheet = false
    
    @State var showCaptureImageView: Bool  = false
    @State var showTakeImageView: Bool  = false
    
    var body: some View {
        ZStack {
            VStack {
                if (self.viewRouter.image != nil)  {
                    Image(uiImage: viewRouter.image!)
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
                    ActionSheet(title: Text("Change Profile Page"), buttons: [ .default(Text("Take Photo with Camera"), action: {self.showTakeImageView.toggle()}), .default(Text("Choose Photo From Camera Roll"), action: {self.showCaptureImageView.toggle()}),
                        .destructive(Text("Cancel").foregroundColor(Color.red))])
                }
            }
            if (showCaptureImageView) {
                VStack {
                    Spacer().frame(height: 360)
                    CaptureImageView(isShown: $showCaptureImageView, image: $viewRouter.image).frame(width: 410, height: 900)
                }.background(CustomColors().light2) // TODO: Change to Match
            }
            if (showTakeImageView) {
                VStack {
                    Spacer().frame(height: 360)
                    TakeImageView(isShown: $showTakeImageView, image: $viewRouter.image).frame(width: 410, height: 900)
                }
            }
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
