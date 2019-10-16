//
//  ForgotPassword.swift
//  Synapse
//
//  Created by Will Hamilton on 10/15/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ForgotPassword: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        Text("HALP I'M FORGOT PASWARD")
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewRouter: ViewRouter())
    }
}
