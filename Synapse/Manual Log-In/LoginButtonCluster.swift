//
//  LoginButtonCluster.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginButtonCluster: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            LoginButton()
            
            
            
            
            Button(action: {
                self.viewRouter.currentPage = "loading"
                NetworkingClient().emailArray() { (json, error) in
                    if let error = error {
                        self.viewRouter.emails = [error.localizedDescription]
                    } else if let json = json {
                        print(json)
                        self.viewRouter.emails = json
                        self.viewRouter.currentPage = "forgot-pass"
                    }
                }
            }) {
                Text("Forgot password?").foregroundColor(CustomColors().lg)
            }
            
            Spacer().frame(height: 65)
            
            NeedAccount()
            
            Spacer().frame(height: 60)
            
            
            
        }
    }
}

struct LoginButtonCluster_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonCluster().environmentObject(ViewRouter())
    }
}
