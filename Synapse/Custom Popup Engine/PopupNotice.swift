//
//  PopupNotice.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct PopupNotice: View {
    @State var heading: String
    @State var content: String
    var body: some View {
        VStack {
            VStack {
                Text(heading).padding()
                Divider()
            }.frame(height: 45)
            
            
            Text(content).padding()
            
                
            Button(action: {}) {
                VStack {
                    Divider()
                    Text("Got it!").padding()
                }
            }.frame(height: 45)
            
        }
        .frame(width: 250)
        .cornerRadius(20)
        .padding(.vertical)
        .background(CustomColors().light2)
    }
}

struct PopupNotice_Previews: PreviewProvider {
    static var previews: some View {
        PopupNotice(heading: "Verification Code Sent", content: "Have a Nice Day!!")
    }
}
