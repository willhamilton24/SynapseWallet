//
//  ContentView.swift
//  Synapse
//
//  Created by Will Hamilton on 9/30/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "welcome" {
                WelcomePage(viewRouter: viewRouter)
                //LoadingView(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "loading" {
                LoadingView(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "login" {
                LoginView(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "signup" {
                SignUpView(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "keep-logs" {
                SetKeepLogs(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "handle" {
                SetHandle(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "terms" {
                AcceptTerms(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "main" {
                MainPage(viewRouter: viewRouter).transition(.opacity)
            } else if viewRouter.currentPage == "email-password" {
                EmailPassword(viewRouter: viewRouter).transition(.opacity)
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
        ContentView(viewRouter: ViewRouter())
    }
}
