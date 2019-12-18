//
//  PhoneInputWrapper.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import PhoneNumberKit


struct PhoneInput: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> PhoneNumberTextField {
        let field = PhoneNumberTextField()
        //field.withFlag = true
        field.withExamplePlaceholder = true
        field.font = UIFont(name:"Roboto-Thin", size: 30.0)
        return field
    }
    
    func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
        uiView.text = text
    }
}
