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
            VStack (alignment: .leading) {
                Spacer().frame(width: 0, height: 30)
                Text("Synapse Wallet iOS by Comitatus Capital")
                    .font(Font.custom("Roboto-Light", size:35))
                    .foregroundColor(CustomColors().light)
                Spacer().frame(width: 370, height: 10)
                Text("Version 1.0.0")
                .font(Font.custom("Roboto-Thin", size:18))
                .foregroundColor(CustomColors().light2)
                .frame(height: 30)
                HStack(spacing: 2) {
                    Text("Front-End Lead: ")
                    .font(Font.custom("Roboto-Thin", size:18))
                    .foregroundColor(CustomColors().light)
                    Button(action: {
                        if let url = URL(string: "http://www.willhamilton.io") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Will Hamilton")
                        .font(Font.custom("Roboto-Thin", size:18))
                    }
                }.frame(height: 30)
                HStack(spacing: 2) {
                    Text("Back-End Lead: ")
                    .font(Font.custom("Roboto-Thin", size:18))
                    .foregroundColor(CustomColors().light)
                    Button(action: {
                        if let url = URL(string: "https://github.com/ncitron") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Noah Citron")
                        .font(Font.custom("Roboto-Thin", size:18))
                    }
                }.frame(height: 30)
                HStack(spacing: 2) {
                    Text("Icons by ")
                    .font(Font.custom("Roboto-Thin", size:14))
                    .foregroundColor(CustomColors().light)
                    Button(action: {
                        if let url = URL(string: "https://icons8.com") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("icons8")
                        .font(Font.custom("Roboto-Thin", size:14))
                    }
                }.frame(height: 30)
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
