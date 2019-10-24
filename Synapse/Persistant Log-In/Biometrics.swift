//
//  Biometrics.swift
//  Synapse
//
//  Created by Will Hamilton on 10/12/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import LocalAuthentication
import Foundation

class BiometricAuth {
    func authenticateTapped(completionHandler: @escaping (_ didWork: Bool) -> Void){
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Express Login"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        print("200")
                        completionHandler(true)
                    } else {
                        print("Error")
                        completionHandler(false)
                        
                    }
                }
            }
        } else {
            print("No Biometrics")
            completionHandler(false)
        }
        
    }
}
