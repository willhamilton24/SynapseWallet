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
        VStack {
            BigLogo()
            
            Spacer().frame(height: 140)
            
            VStack {
                LoadingAnimation()
                Text("  Loading...").foregroundColor(.white).font(Font.custom("Roboto-Light", size:50))
            }
            
            Spacer().frame(height: 220)
        }.background(CustomColors().dark)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(viewRouter: ViewRouter())
    }
}
