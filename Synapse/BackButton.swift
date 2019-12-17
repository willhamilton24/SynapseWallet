//
//  BackButton.swift
//  Synapse
//
//  Created by Will Hamilton on 11/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let destination: String
    
    var body: some View {
        ZStack {
            Button(action: {
                self.viewRouter.currentPage = self.destination
            }) {
                Text("")
            }.frame(minWidth: 100, maxWidth: 100)
                .padding(.vertical)
                //.padding(.vertical, 0)
                .foregroundColor(CustomColors().light)
                .background(CustomColors().dark)
                .opacity(0.2)
                .cornerRadius(15)
            
            HStack {
                Image("out")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("back")
                .font(.custom("Roboto-Light", size:24))
                    .foregroundColor(.white)
            }
        }.offset(x: -30)
    }
}


struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(destination: "welcome").environmentObject(ViewRouter())
    }
}
