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
            CreditInfo()
            VStack {
                Spacer().frame(height: 36)
                
                Text("Legal Stuff")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Thin", size:40))
                
                Spacer().frame(height: 10)

                Text("Comitatus")
                    .padding(.trailing, 250)
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Light", size:28))
                
                Spacer().frame(height: 12)
                
                HStack(spacing: 30) {
                    Button(action: {}) {
                        Text("Terms of Service").font(Font.custom("Roboto-Light", size:24))
                    }
                    Button(action: {}) {
                        Text("Privacy Policy").font(Font.custom("Roboto-Light", size:24))
                    }
                }.padding(.bottom, 12)
                
                Text("Synapse")
                    .padding(.trailing, 280)
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Light", size:28))
                
                Spacer().frame(height: 12)
                
                HStack(spacing: 30) {
                    Button(action: {}) {
                        Text("Terms of Service").font(Font.custom("Roboto-Light", size:24))
                    }
                    Button(action: {}) {
                        Text("Privacy Policy").font(Font.custom("Roboto-Light", size:24))
                    }
                }
                
                Spacer().frame(height: 210)
                
                
                
            }
        }
            .frame(maxWidth: 420)
        .edgesIgnoringSafeArea(.vertical)
        .background(CustomColors().dark)
    }
}

struct CreditsPage_Previews: PreviewProvider {
    static var previews: some View {
        CreditsPage().environmentObject(ViewRouter())
    }
}
