//
//  CreditsPage.swift
//  Synapse
//
//  Created by Will Hamilton on 11/21/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct CreditsPage: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            CreditsHeader()
            VStack {
                Text("Synapse Wallet iOS by Comitatus Capital")
                    .font(Font.custom("Roboto-Thin", size:35))
                    .foregroundColor(CustomColors().light)
            }
        }
        
        .edgesIgnoringSafeArea(.vertical)
        .background(CustomColors().dark)
    }
}

struct CreditsPage_Previews: PreviewProvider {
    static var previews: some View {
        CreditsPage().environmentObject(ViewRouter())
    }
}
