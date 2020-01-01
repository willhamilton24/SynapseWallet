//
//  ChooseHandleView.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ChooseHandleView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(spacing:0){
            Text("Choose a Handle")
                .font(Font.custom("Roboto-Light", size: 36))
                .foregroundColor(CustomColors().lg)
                

            Text("This is how other users will find you on Synapse")
                .font(Font.custom("Roboto-Light", size: 14))
                .frame(width: 325)
            
            Image("big-user")
            .resizable()
            .frame(width: 130, height: 130)
            
            VStack (spacing: 0) {
                 HStack (spacing: 8) {
                    Image("edit")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    ZStack(alignment: .leading) {
                        if viewRouter.handle.isEmpty {
                            Text("Handle")
                            .foregroundColor(CustomColors().dark)
                            .padding(.leading, 5)
                        }
                        TextField("", text: $viewRouter.handle)
                    }
                    .padding(.vertical, 5)
                    .font(Font.custom("Roboto-Thin", size:24))
                    
                    }.padding(.horizontal, 20)
                
                Divider()
                    .frame(width: 320, height: 2)
                    .background(CustomColors().dark)
                
            }
            
            Spacer().frame(height: 25)
            
//            HStack (spacing: 15){
//                if (self.viewRouter.handle.count >= 4 && self.viewRouter.handle.count <= 24) {
//                   Image("dot-p")
//                    .resizable()
//                    .frame(width: 18, height: 18)
//               } else {
//                    Image("dot-r")
//                    .resizable()
//                    .frame(width: 18, height: 18)
//                }
//
//                Text("4-24 Characters")
//                    .font(Font.custom("Roboto-Light", size: 18))
//            }
//            .foregroundColor(CustomColors().dark)
//            .padding(.bottom)
//
//            HStack (spacing: 15){
//                if self.viewRouter.users.contains(self.viewRouter.handle.lowercased()) {
//                    Image("dot-r")
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                } else {
//                     Image("dot-p")
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                }
//
//                 Text("Is Available").font(Font.custom("Roboto-Light", size: 18))
//            }.offset(x: -19, y: 0.0).foregroundColor(CustomColors().dark)
            
            
        }
        .frame(width: 350, height: 350)
    }
}

struct ChooseHandleView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseHandleView().environmentObject(ViewRouter())
    }
}
