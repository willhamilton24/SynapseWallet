//
//  CheckBoxWrapper.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import UIKit
import M13Checkbox

struct CheckBoxWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> M13Checkbox {
        return M13Checkbox(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
    }
    
    func updateUIView(_ uiView: M13Checkbox, context: Context) {
        
    }
}
