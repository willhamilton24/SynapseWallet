//
//  EditName.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EditName: View {
    @State var name: String
    @State private var editingName: Bool = false
    
    var body: some View {
        HStack {
            if self.editingName {
                TextField("12345", text: $name)
                    .font(Font.custom("Roboto-Thin", size:50))
                    .foregroundColor(CustomColors().light)
                    .padding(.leading, 10)
                    .frame(width: 350)
            } else {
                Text(self.name)
                    .font(Font.custom("Roboto-Thin", size:50))
                    .padding(.leading, 10)
            }
            
            
            Button(action: {self.editingName.toggle()}) {
                if self.editingName {
                    Image("check")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(CustomColors().lg)
                        .padding(.top, 15)
                } else {
                    Image("edit")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(CustomColors().prime)
                        .padding(.top, 15)
                }
            }
            .padding(.bottom, 0)
        }
    }
}

struct EditName_Previews: PreviewProvider {
    static var previews: some View {
        EditName(name: "Anonymous")
    }
}
