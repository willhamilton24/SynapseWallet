//
//  CreditsHeader.swift
//  Synapse
//
//  Created by Will Hamilton on 11/21/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//
import SwiftUI

struct CreditsHeader: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height:135)
            
            HStack(spacing: 10.0) {
                
                Text("Credits ")
                
                Spacer()
                    .frame(width: 100, height: 20, alignment: .center)
                
                XButton()
                
                    
            }
        }
        .font(Font.custom("Roboto-Thin", size:72))
        .padding()
        .foregroundColor(CustomColors().light)
        .frame(width: 500, height: 225)
        .fixedSize()
        .background(CustomColors().primeGradiant)
    }

}

struct CreditsHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader().environmentObject(ViewRouter())
    }
}

