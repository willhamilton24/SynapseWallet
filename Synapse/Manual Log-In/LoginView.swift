//
//  LoginView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    let screenSize: CGRect = UIScreen.main.bounds

    
    var body: some View {
        ZStack {
            
            Text("")
            .frame(minWidth: screenSize.width, minHeight: screenSize.height + 120)
            .edgesIgnoringSafeArea(.vertical)
            .background(CustomColors().primeGradiant)
            
            VStack {
                BigLogo()
                .frame(width: 500, height: 240)
                //.offset(x: -30)
                
                Spacer().frame(height: 75)
                
                VStack {
                    
                    HandleAndPassword()
                    
                    Spacer().frame(height: 30)
                    
                    LoginButtonCluster()

                    
                    //Spacer().frame(height: 130)
                    
                }.padding(.horizontal, 50)
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(ViewRouter())
    }
}
