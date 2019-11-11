//
//  EditHandle.swift
//  Synapse
//
//  Created by Will Hamilton on 11/11/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EditHandle: View {
    @State var handle: String
    @State private var editingHandle: Bool = false
    
    var body: some View {
        
        HStack {
            if self.editingHandle {
                TextField("12345", text: $handle)
                    .font(Font.custom("Roboto-Thin", size:28))
                    .foregroundColor(CustomColors().light)
                    .padding(.leading, 10)
                    .frame(width: 350)
            } else {
                Text(self.handle)
                    .font(Font.custom("Roboto-Thin", size:28))
                    .padding(.leading, 10)
            }
            
            
            Button(action: {self.editingHandle.toggle()}) {
                if self.editingHandle {
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
                        .padding(.top, 0)
                }
            }
            .padding(.bottom, 0)
        }
    }
}

struct EditHandle_Previews: PreviewProvider {
    static var previews: some View {
        EditHandle(handle: "myhandle")
    }
}
