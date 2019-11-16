//
//  EditEmail.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EditEmail: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email: String
    @State private var editingEmail: Bool = false
    
    var body: some View {
        HStack {
            if self.editingEmail {
                TextField("12345", text: $email)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .foregroundColor(CustomColors().light)
                    .padding(.leading, 10)
                    .frame(width: 350)
            } else {
                Text(self.email)
                    .font(Font.custom("Roboto-Thin", size:18))
                    .padding(.leading, 10)
            }
            
            
            Button(action: {
                self.editingEmail.toggle()
                self.viewRouter.profileInfo.email = self.email
            }) {
                if self.editingEmail {
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

struct EditEmail_Previews: PreviewProvider {
    static var previews: some View {
        EditEmail(email: "email@example.com").environmentObject(ViewRouter())
    }
}
