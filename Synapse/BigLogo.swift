//
//  BigLogo.swift
//  Synapse
//
//  Created by Will Hamilton on 10/8/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct BigLogo: View {
    var body: some View {
        
            VStack(alignment: .leading) {
                Spacer().frame(height: 70)
                Text("SYNAPSE")
                Text("WALLET.")
            }.font(Font.custom("Roboto-Thin", size:75))
                .padding()
                .foregroundColor(CustomColors().light)
                .frame(minWidth: 500, maxWidth: .infinity, idealHeight: 350)
                .fixedSize()
                .position(x:182,y:170)
                .background(CustomColors().primeGradiant)
                .edgesIgnoringSafeArea(.top)
            
            //Spacer().frame(height: 30)
            
            //Text("Sign Up").font(.title).padding().foregroundColor(CustomColors().light)
            
            //SignUpProgress()
                
        
    }
}

struct BigLogo_Previews: PreviewProvider {
    static var previews: some View {
        BigLogo()
    }
}
