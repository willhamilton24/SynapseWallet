//
//  PageHeader.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct PageHeader: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height:125)
            
            HStack(spacing: 10.0) {
                
                SWLogo()
                
                Spacer()
                    .frame(width: 150, height: 20, alignment: .center)
                
                XButton()
                
                    
            }
        }
        .font(Font.custom("Roboto-Thin", size:36))
        .padding()
        .foregroundColor(CustomColors().light)
        .frame(width: 500, height: 235)
        .fixedSize()
        .background(CustomColors().primeGradiant)
    }
}

struct PageHeader_Previews: PreviewProvider {
    static var previews: some View {
        PageHeader().environmentObject(ViewRouter())
    }
}
