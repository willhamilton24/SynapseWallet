//
//  NeedAccount.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct NeedAccount: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack (spacing: 6){
            Text("Don't have an account yet?")
                .font(Font.custom("Roboto-Thin", size: 20))
                .foregroundColor(.white)
            
            Button(action: {
                self.viewRouter.currentPage = "handle"
            }) {
                Text("Get Started")
                    .font(Font.custom("Roboto-Light", size: 23))
                    .foregroundColor(CustomColors().lg)
            }
        }
        
    }
}

struct NeedAccount_Previews: PreviewProvider {
    static var previews: some View {
        NeedAccount().environmentObject(ViewRouter())
    }
}
