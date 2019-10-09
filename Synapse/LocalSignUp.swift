//
//  LocalSignUp.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct LocalSignUp: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        Text("Local Sign Up")
    }
}

struct LocalSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LocalSignUp(viewRouter: ViewRouter())
    }
}
