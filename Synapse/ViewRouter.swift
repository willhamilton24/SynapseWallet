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
import UIKit

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    
    var currentPage: String = "main" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    var joinDate: String  = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var image: UIImage?  = nil {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var imageEncoding: String?  = nil {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var profileInfo = (email: "", location: "", joined: Double(0.0), name: "", profilePic: "") {
        didSet {
            objectWillChange.send(self)
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
    
    var handle: String = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var email: String = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var password: String = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var keepLogs: Bool = true {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var coin: String = "BTC" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    var balances = (btc: 2.31331, eth: 34.9471, ltc: 68.00, usd: 1205.55) {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var prices = (btc: 9000.0, eth: 220.0, ltc: 95.0, usd: 1.0) {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var accountValues = (btc: 0.0, eth: 0.0, ltc: 0.0, usd: 0.0) {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var location = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var name = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var phone = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var birth = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var signUpPage = 0 {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}
