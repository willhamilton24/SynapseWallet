//
//  NetworkingClient.swift
//  Synapse
//
//  Created by Will Hamilton on 10/10/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient  {
    
    typealias WebServiceResponse = ([String]?, Error?) -> Void
    
    func handleArray(completion: @escaping WebServiceResponse) {
        
        var urlRequest = URLRequest(url: URL(string: "https://serverless.willhamilton24.now.sh/api/auth/getUsers")!)
        urlRequest.httpMethod = "POST"
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
//            } else if let jsonArray = response.result.value as? [[String: Any]] {
//                print(jsonArray)
//                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let handles = jsonDict["usernames"] as? [String]
                print(handles)
                completion(handles, nil)
            }
        }
    }
}
