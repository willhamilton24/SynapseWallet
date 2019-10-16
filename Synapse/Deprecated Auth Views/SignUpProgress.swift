//
//  SignUpProgress.swift
//  Synapse
//
//  Created by Will Hamilton on 10/8/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SignUpProgress: View {
    var body: some View {
        HStack (alignment: .center, spacing: 0) {
            
            Text("1")
                .frame(width: 100)
                .background(CustomColors().second)
                .foregroundColor(CustomColors().light)
                .border(CustomColors().light, width: 3)
                
            Text("2")
                .frame(width: 100)
                .background(CustomColors().second)
                .foregroundColor(CustomColors().light)
                .border(CustomColors().light, width: 3)
            Text("3")
                .frame(width: 100)
                .background(CustomColors().dark)
                .foregroundColor(CustomColors().light)
            .border(CustomColors().light, width: 3)
            Text("4")
                .frame(width: 100)
                .background(CustomColors().dark)
                .foregroundColor(CustomColors().light)
                .border(CustomColors().light, width: 3)
        }.font(.system(size: 35))
        
    }
}

struct SignUpProgress_Previews: PreviewProvider {
    static var previews: some View {
        SignUpProgress()
    }
}
