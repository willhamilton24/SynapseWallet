//
//  ViewRouter.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    
    var currentPage: String = "welcome" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    var users: [String] = ["404"] {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var emails: [String] = ["404"] {
        didSet {
            objectWillChange.send(self)
        }
    }

    
    var token: String  = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var method: String = "local" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var handle: String = "myHandle" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var email: String = "example@domain.com" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var password: String = "password" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var keepLogs: Bool = true {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var balances = (btc: 0.0, eth: 0.0, ltc: 0.0) {
        didSet {
            objectWillChange.send(self)
        }
    }

    
}
