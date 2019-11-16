//
//  EditLocation.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EditLocation: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var locale: String
    @State private var editingLocale: Bool = false
    
    var body: some View {
        HStack {
            if self.editingLocale {
                TextField("12345", text: $locale)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .foregroundColor(CustomColors().light)
                    .padding(.leading, 10)
                    .frame(width: 350)
            } else {
                Text(self.locale)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .padding(.leading, 10)
            }
            
            
            Button(action: {
                self.editingLocale.toggle()
                self.viewRouter.profileInfo.location = self.locale
            }) {
                if self.editingLocale {
                    Image("check")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(CustomColors().lg)
                        .padding(.top, 15)
                } else {
                    Image("edit")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(CustomColors().prime)
                        .padding(.top, 0)
                }
            }
            .padding(.bottom, 0)
        }
    }
}

struct EditLocation_Previews: PreviewProvider {
    static var previews: some View {
        EditLocation(locale: "Palm Beach, FL").environmentObject(ViewRouter())
    }
}
