//
//  LoadingAnimation.swift
//  Synapse
//
//  Created by Will Hamilton on 10/10/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import Lottie

struct LoadingAnimation: View {
    var body: some View {
        LottieView(filename: "loader").frame(maxWidth: 200, maxHeight: 200)
    }
}

struct LoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimation()
    }
}
