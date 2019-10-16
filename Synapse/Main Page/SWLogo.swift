//
//  SWLogo.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SWLogo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("SYNAPSE")
            Text("WALLET.")
        }.font(.title).foregroundColor(.yellow)
    }
}

struct SWLogo_Previews: PreviewProvider {
    static var previews: some View {
        SWLogo()
    }
}
