//
//  Socials.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct Socials: View {
    var body: some View {
        HStack {
            Image("fb").resizable().frame(width: 40, height: 40).foregroundColor(.yellow).background(Color.white)
            Image("ig").resizable().frame(width: 40, height: 40).foregroundColor(.yellow).background(Color.white)
            Image("tw").resizable().frame(width: 40, height: 40).foregroundColor(.yellow).background(Color.white)
        }
    }
}

struct Socials_Previews: PreviewProvider {
    static var previews: some View {
        Socials()
    }
}
