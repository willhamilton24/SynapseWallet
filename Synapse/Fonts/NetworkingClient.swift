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
    
    typealias WebServiceResponseArray = ([String]?, Error?) -> Void
    typealias WebServiceResponseString = (String?, Error?) -> Void
    
    func handleArray(completion: @escaping WebServiceResponseArray) {
        
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
    
    func registerUser(username: String, password: String, email: String, saveLogs: Bool, completion: @escaping WebServiceResponseString) {
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "email" : email,
            "saveLogs": saveLogs
        ]
        
        //var urlRequest = URLRequest(url: URL(string: "https://serverless.willhamilton24.now.sh/api/auth/signup")!)
        //urlRequest.httpMethod = "POST"
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/auth/signup", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                    if let error = response.error {
                        print(error)
                        completion(nil, error)
        //            } else if let jsonArray = response.result.value as? [[String: Any]] {
        //                print(jsonArray)
        //                completion(jsonArray, nil)
                    } else if let jsonDict = response.result.value as? [String: Any] {
                        let succ = jsonDict["success"] as? String
                        print(succ)
                        completion(succ, nil)
                    }
                }
        
        
    }
    
    func login(username: String, password: String, completion: @escaping WebServiceResponseString) {
        let parameters: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/auth/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                    if let error = response.error {
                        print(error)
                        completion(nil, error)
        //            } else if let jsonArray = response.result.value as? [[String: Any]] {
        //                print(jsonArray)
        //                completion(jsonArray, nil)
                    } else if let jsonDict = response.result.value as? [String: Any] {
                        let token = jsonDict["token"] as? String
                        print(token)
                        completion(token, nil)
                    }
                }
    }
}