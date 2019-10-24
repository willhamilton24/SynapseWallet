//
//  EmailValidator.swift
//  Synapse
//
//  Created by Will Hamilton on 10/24/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation

struct EmailValidator {
    func isValidEmail(testStr:String) -> Bool {
         let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
         let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
         return emailTest.evaluate(with: testStr)
    }
}
