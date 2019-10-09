//
//  CustomColors.swift
//  Synapse
//
//  Created by Will Hamilton on 10/8/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomColors {
    let dark = Color(UIColor(red:0.09, green:0.11, blue:0.11, alpha:1.0))
    let light = Color(UIColor(red:0.94, green:0.91, blue:0.96, alpha:1.0))
    let prime = Color(UIColor(red:0.00, green:0.28, blue:1.00, alpha:1.0))
    let second = Color(UIColor(red:0.35, green:0.39, blue:0.97, alpha:1.0))
    let third = Color(UIColor(red:0.45, green:0.82, blue:0.87, alpha:1.0))
    
    let prime2 = Color(UIColor(red:0.00, green:1.00, blue:0.78, alpha:1.0))
    
    let primeGradiant = LinearGradient(gradient: Gradient(colors: [Color(UIColor(red:0.00, green:0.28, blue:1.00, alpha:1.0)), Color(UIColor(red:0.00, green:1.00, blue:0.78, alpha:1.0))]), startPoint: .leading, endPoint: .trailing)
}
