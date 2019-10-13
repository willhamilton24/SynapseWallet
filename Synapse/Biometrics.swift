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
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //self?.unlockSecretMessage()
                        print("200")
                        completionHandler(true)
                        
                        
                        // Send Login Request from local credentials
                        
                    } else {
                        print("Error")
                        completionHandler(false)
                        // Port to SwiftUI
//                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
//                        ac.addAction(UIAlertAction(title: "OK", style: .default))
//                        self.present(ac, animated: true)
                        
                    }
                }
            }
        } else {
            // no biometry
            completionHandler(false)
        }
        
    }
}
