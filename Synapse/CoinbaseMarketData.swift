//
//  CoinbaseMarketData.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import Alamofire

class CoinbaseMarketData {
    
    typealias WebServiceResponseDouble = (Double?, Error?) -> Void
    typealias WebServiceResponseDictionary = ([String: Any]?, Error?) -> Void
    
    func getTicker(currency: String, completion: @escaping WebServiceResponseDictionary) {
        var urlRequest = URLRequest(url: URL(string: "https://api.pro.coinbase.com/products/" + currency + "-USD/ticker")!) // TODO custon curr
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                print(jsonDict["price"])
                print(type(of: jsonDict["price"]))
                completion(jsonDict, nil)
            }
        }
    }
    
    func getAllTickers() {
        // Get All Tickers
    }
    
    func getQuote(currency: String, completion: @escaping WebServiceResponseDouble) {
        getTicker(currency: currency) { (json, err) in
            if json == nil {
                completion(nil, err)
            } else {
                if var currentPrice = (json!["price"] as? NSString)?.doubleValue {
                    currentPrice = currentPrice * 0.985
                    completion(currentPrice, nil)
                } else {
                    print("Something went wrong")
                }
            }
        }
    }
    
    
}
