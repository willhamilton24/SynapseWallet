//
//  PersistantView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/12/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import LocalAuthentication
import SwiftUI

struct PersistantView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    
    var body: some View {
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            VStack {
                Spacer().frame(height: 350)
                Text("")
                Button(action: {
                    BiometricAuth().authenticateTapped() { didWork in
                        if didWork {
                            // Login
                            let defaults = UserDefaults.standard
                            NetworkingClient().login(
                            username: defaults.string(forKey: defaultsKeys.handleKey)!,
                            password: defaults.string(forKey: defaultsKeys.passwordKey)!) { (json, error) in
                                if json != nil {
                                    if json == "invalid username/password" {
                                        print("INVALID")
                                    } else {
                                        self.viewRouter.token = json!
                                        self.viewRouter.currentPage = "main"
                                    }
                                }
                            }
                            self.viewRouter.currentPage = "main"
                        } else {
                            print("Try again or login normally")
                        }
                    }
                    
                    
                }) {
                    Text("Login With Biometrics").font(.title)
                }
                
                Button(action: {
                    let defaults = UserDefaults.standard
                    defaults.set(nil, forKey: defaultsKeys.handleKey)
                    defaults.set(nil, forKey: defaultsKeys.passwordKey)
                    self.viewRouter.currentPage = "welcome"
                }) {
                    Text("or login normally")
                }
            }
        }
    }
}

struct PersistantView_Previews: PreviewProvider {
    static var previews: some View {
        PersistantView(viewRouter: ViewRouter())
    }
}
