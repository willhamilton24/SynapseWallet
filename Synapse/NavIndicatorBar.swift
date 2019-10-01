//
//  NavIndicatorBar.swift
//  Synapse
//
//  Created by Will Hamilton on 9/30/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct NavIndicatorBar: View {
    var body: some View {
        
        HStack(spacing: 10) {
            
            VStack(alignment: .leading) {
                Text("SYNAPSE")
                Text("WALLET.")
            }.font(.title).foregroundColor(.yellow)
            
            
            //Image("Synapse").resizable().frame(width: 100, height: 80)
            // TODO: Add Arrow
            //Text("Instant Transfer") // Signals Left Swipe to Pay
            //.font(.title)
            
            Spacer().frame(width: 150, height: 20, alignment: .center)
            
            // TODO: Add Arrow
            //Text("Instant Transfer") // Signals Right Swipe For Account Page
                //.font(.title)
            Button(action: {}) {
                Image("gear")
            }.foregroundColor(.yellow)
        }
    }
}

struct NavIndicatorBar_Previews: PreviewProvider {
    static var previews: some View {
        NavIndicatorBar()
    }
}
