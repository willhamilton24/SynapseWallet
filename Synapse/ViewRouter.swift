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
    
    var method: String = "local" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var handle: String = "Will" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var email: String = "Will" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var password: String = "Will" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var keepLogs: Bool = true {
        didSet {
            objectWillChange.send(self)
        }
    }
    
}
