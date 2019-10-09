//
//  HttpRequest.swift
//  Synapse
//
//  Created by Will Hamilton on 10/4/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import Alamofire

class MakeAPIRequest: Encodable {
    let handle: String
    let authtoken: String
    
    init(handle: String, authtoken: String) {
        self.handle = handle
        self.authtoken = authtoken
    }
}

class TransactionRequest: MakeAPIRequest {
    let amount: Double
    let currency: String
    let transactionType: String
    
    init(handle: String, authtoken: String, amount: Double, currency: String, transactionType: String) {
        self.amount = amount
        self.currency = currency
        self.transactionType = transactionType
        super.init(handle: handle, authtoken: authtoken)
    }
}

class InstantTransferRequest: TransactionRequest {
    let recipientHandle: String
    
    init(handle: String, authtoken: String, amount: Double, currency: String, transactionType: String, recipientHandle: String) {
        self.recipientHandle = recipientHandle
        super.init(handle: handle, authtoken: authtoken, amount: amount, currency: currency, transactionType: transactionType)
    }
}

struct HttpRequests {
    let baseURI = "https://serverless.willhamilton24.now.sh/api"
    
    func getTransactionLogs(handle: String, authtoken: String) -> Array<String> {
        let body = MakeAPIRequest(handle: handle, authtoken: authtoken)
        let myTransactions = Array<String>()
        
        AF.request(baseURI + "/logs", method: .get, parameters: body, encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
        
        return myTransactions
        
    }
    
}
