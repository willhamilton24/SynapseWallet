//
//  LoadingView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/10/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Text("")
            .frame(minWidth: screenSize.width, minHeight: screenSize.height + 80)
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().primeGradiant)
            
            VStack {
                BigLogo()
                .frame(width: 500, height: 240)
                
                Spacer()
                    .frame(height: 40)
            
                VStack {
                    LoadingAnimation()
                        .padding()
                    Text("  Loading...")
                        .foregroundColor(CustomColors().prime)
                        .font(Font.custom("Roboto-Light", size:35))
                    Spacer().frame(height: 20)
                }
                .background(Color.white)
                .cornerRadius(20)
                .frame(minWidth: 350, maxWidth: 420)
                .clipped()
                .shadow(color: .gray, radius: 8)
                
                Spacer()
                .frame(height: 50)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView().environmentObject(ViewRouter())
    }
}
