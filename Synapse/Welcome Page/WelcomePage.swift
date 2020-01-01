//
//  WelcomePage.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct WelcomePage: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var token: String = "Your Handle"
    
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
                .frame(height:80)
                
                WelcomeButtons()
                
//                Spacer()
//                .frame(height: 75)
                
            }.offset(y: -5)
            //CustomPop(active: true, heading: "Verification Code Sent", content: "Have a Nice Day!!")
        }
        .padding(.vertical, 30)
        .onAppear {
            let defaults = UserDefaults.standard
            if (defaults.string(forKey: defaultsKeys.handleKey) != nil && defaults.string(forKey: defaultsKeys.handleKey) != "") {
                self.viewRouter.currentPage = "persist"
            }
            
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage().environmentObject(ViewRouter())
    }
}
