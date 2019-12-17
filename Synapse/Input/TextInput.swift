//
//  TextInput.swift
//  Synapse
//
//  Created by Will Hamilton on 12/17/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI
import AnimatedTextInput

struct TextInput: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<TextInput>) -> AnimatedTextInput {
        return AnimatedTextInput()
    }
    
    func updateUIView(_ textField: AnimatedTextInput, context: UIViewRepresentableContext<TextInput>) {

    }(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
}
