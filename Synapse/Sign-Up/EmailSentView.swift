//
//  EmailSentView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/12/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct EmailSentView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack {
            
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)
            
            VStack {
                
                Spacer().frame(height: 235)
                
                Text("Verify your email")
                
                Button(action: {
                    self.viewRouter.currentPage = "laoding"
                    NetworkingClient().login(username: self.viewRouter.handle, password: self.viewRouter.password) { (json2, error2) in
                            if let error2 = error2 {
                                print(error2)
                                self.viewRouter.token = error2.localizedDescription
                                self.viewRouter.currentPage = "email-v"
                            } else if let json2 = json2 {
                                print(json2)
                                self.viewRouter.token = json2
                                self.viewRouter.currentPage = "main"
                        }
                    }
                }) {
                    Text("Verified")
                }
            }
        }
    }
}

struct EmailSentView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSentView(viewRouter: ViewRouter())
    }
}
