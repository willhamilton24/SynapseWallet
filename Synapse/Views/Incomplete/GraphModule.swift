//
//  GraphModule.swift
//  Synapse
//
//  Created by Will Hamilton on 10/1/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
//import Charts

struct GraphModule: View {
    var body: some View {
        
        VStack() {
            Image("graph-placeholder")
            .resizable()
            .frame(width: 500, height: 170)
            
            Spacer().frame(width: 0, height: 25)
            
            Text("1 mBTC = " + "$" + "8.4332" + " USD")
            .font(.headline)
            Spacer().frame(width: 0, height: 10)
            HStack() {
                Text("1 Day High: " + "$8.5389")
                Text("1 Year High: " + "10.2312")
            }.font(.subheadline)
            Spacer().frame(width: 0, height: 10)
            HStack() {
                Text("1 Day Low: " + "$8.2875")
                Text("1 Year Low: " + "7.9831")
            }.font(.subheadline)
            
            Divider().frame(width: 250, height: 20, alignment: .center).padding(.top, 12)
        }
    }
}

struct GraphModule_Previews: PreviewProvider {
    static var previews: some View {
        GraphModule()
    }
}
