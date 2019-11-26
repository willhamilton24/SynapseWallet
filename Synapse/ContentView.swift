//
//  ContentView.swift
//  Synapse
//
//  Created by Will Hamilton on 9/30/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack {
                if viewRouter.currentPage == "welcome" {
                    WelcomePage().transition(.opacity)
                } else if viewRouter.currentPage == "loading" {
                    LoadingView().transition(.opacity)
                } else if viewRouter.currentPage == "login" {
                    LoginView().transition(.opacity)
                } else if viewRouter.currentPage == "keep-logs" {
                    SetKeepLogs().transition(.opacity)
                } else if viewRouter.currentPage == "handle" {
                    SetHandle().transition(.opacity)
                } else if viewRouter.currentPage == "terms" {
                    AcceptTerms().transition(.opacity)
                } else if viewRouter.currentPage == "main" {
                    MainPage().transition(.opacity)
                } else if viewRouter.currentPage == "email-password" {
                    EmailPassword().transition(.opacity)
                } else if viewRouter.currentPage == "persist" {
                    PersistantView().transition(.opacity)
                } else if viewRouter.currentPage == "email-v" {
                    EmailSentView().transition(.opacity)
                } else if viewRouter.currentPage == "forgot-pass" {
                    ForgotPassword().transition(.opacity)
                } else if viewRouter.currentPage == "forgot-pass-sent" {
                    ResetEmailSent().transition(.opacity)
                } else if viewRouter.currentPage == "profile" {
                    ProfilePage().transition(.opacity)
                } else if viewRouter.currentPage == "credits" {
                    CreditsPage().transition(.opacity)
                }
        }.background(CustomColors().dark)
            .edgesIgnoringSafeArea(.vertical)
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
