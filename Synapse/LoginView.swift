//
//  LoginView.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Login").font(.title).foregroundColor(.yellow)
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}
