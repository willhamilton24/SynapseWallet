//
//  LoadingView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/10/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            VStack {
                Spacer().frame(height: 235)
            
                VStack {
                    LoadingAnimation()
                    Text("  Loading...").foregroundColor(.white).font(Font.custom("Roboto-Light", size:50))
                }
            }
        }.background(CustomColors().dark)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(viewRouter: ViewRouter())
    }
}
