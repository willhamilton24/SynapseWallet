//
//  PasswordResetSentView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/24/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ResetEmailSent: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack {
            
            BigLogo()
                .frame(width: 500, height: 240)
                .position(x: 180, y: 80)
            
            VStack {
                
                Spacer()
                    .frame(height: 235)
                
                Image("mail")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .padding(.bottom, 50)
                
                Text("Reset Link Sent")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Light", size:30))
                Text("Check your email to reset your password")
                    .foregroundColor(CustomColors().light)
                    .font(Font.custom("Roboto-Thin", size:22))
                    .padding(.bottom, 20)
                
                VStack (spacing: 0) {
                    Text("We have sent the reset email to")
                    Text(self.viewRouter.email)
                }
                .foregroundColor(CustomColors().light)
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    self.viewRouter.currentPage = "login"
                }) {
                    Text("Back to Login").padding().font(Font.custom("Roboto-Thin", size:32)).foregroundColor(CustomColors().light)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(CustomColors().lg)
                .cornerRadius(30)
                .padding()
                .foregroundColor(CustomColors().light)
            }
        }
        .background(CustomColors().dark)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ResetEmailSent_Previews: PreviewProvider {
    static var previews: some View {
        ResetEmailSent(viewRouter: ViewRouter())
    }
}
