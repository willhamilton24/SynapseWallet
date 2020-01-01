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
    
    let defaults = UserDefaults.standard
    
    let coinbaseID = "2672312f02150b15ff35f2af83bfb07b7102408d7932fc92b2e3d57d44c50398"
    let coinbaseSecret = "60f21a864aa0546cb0cdbc0180adbdc9643db5a15548b0e8f3c4940492176be4"
    
    typealias WebServiceResponseArray = ([String]?, Error?) -> Void
    typealias WebServiceResponseString = (String?, Error?) -> Void
    typealias WebServiceResponseDouble = (Double?, Error?) -> Void
    typealias WebServiceResponseBoolean = (Bool?, Error?) -> Void
    typealias WebServiceResponseDictionary = ([String: Any]?, Error?) -> Void
    typealias WebServiceResponseDoubleDictionary = ([String: Double]?, Error?) -> Void
    typealias WebServiceResponseTuple = ((profile_pic: String?, joined: Double?, name: String?, location: String?, email: String?, balances: [String: Double]?)?, Error?) -> Void
    
    func handleArray(completion: @escaping WebServiceResponseArray) {
        
        var urlRequest = URLRequest(url: URL(string: "https://serverless.willhamilton24.now.sh/api/auth/getUsers")!)
        urlRequest.httpMethod = "POST"
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let handles = jsonDict["usernames"] as? [String]
                print(handles)
                completion(handles, nil)
            }
        }
    }
    
    func emailArray(completion: @escaping WebServiceResponseArray) {
        
        var urlRequest = URLRequest(url: URL(string: "https://serverless.willhamilton24.now.sh/api/auth/getEmails")!)
        urlRequest.httpMethod = "POST"
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let emails = jsonDict["emails"] as? [String]
                print(emails)
                completion(emails, nil)
            }
        }
    }
    
    func registerUser(username: String, password: String, email: String, saveLogs: Bool, receiveEmails: Bool, completion: @escaping WebServiceResponseString) {
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "email" : email,
            "saveLogs": saveLogs,
            "receiveEmails": receiveEmails
        ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/auth/signup", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                    if let error = response.error {
                        print(error)
                        completion(nil, error)
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
                    } else if let jsonDict = response.result.value as? [String: Any] {
                        let token = jsonDict["token"] as? String
                        if token != "email not verified" {
                            self.defaults.set(parameters["username"], forKey: defaultsKeys.handleKey)
                            self.defaults.set(parameters["password"], forKey: defaultsKeys.passwordKey)
                        }
                        print(token)
                        completion(token, nil)
                    }
                }
    }
    
    
    func forgotPassword(email: String, completion: @escaping WebServiceResponseBoolean) {
        let parameters: [String: Any] = [ "email": email ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/auth/sendPasswordResetEmail", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
                    if let error = response.error {
                        print(error)
                        completion(nil, error)
                    } else if let jsonDict = response.result.value as? [String: Any] {
                        let token = jsonDict["success"] as? Bool
                        print(token)
                        completion(token, nil)
                    }
                }
    }
    
    func getBalances(username: String, token: String, completion: @escaping WebServiceResponseDoubleDictionary) {
        let parameters: [String: Any] = [
            "username": username,
            "token": token
        ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/account/getBalances", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let balances = jsonDict as? [String: Double]
                print(balances)
                completion(balances, nil)
            }
        }
        
    }
    
    func getMyProfileInfo(username: String, token: String, completion: @escaping WebServiceResponseTuple) {
        let parameters: [String: Any] = [
            "username": username,
            "token": token
        ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/account/getOwnInfo", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let profile_pic = jsonDict["profilePic"] as? String
                let joined = jsonDict["joined"] as? Double
                let name = jsonDict["name"] as? String
                let location = jsonDict["location"] as? String
                let email = jsonDict["email"] as? String
                let balances = jsonDict["balances"] as? [String: Double]
                
                let profileTuple = (profile_pic: profile_pic, joined: joined, name: name, location: location, email: email, balances: balances)
                
                completion(profileTuple, nil)
            }
        }
        
    }
    
    func updateMyProfileInfo(username: String, token: String, name: String?, profilePic: String?, location: String?, completion: @escaping WebServiceResponseString) {
        let parameters: [String: Any] = [
            "username": username,
            "token": token,
            "newName": name,
            "newProfilePic": profilePic,
            "newLocation":location
        ]
        
        Alamofire.request("https://serverless.willhamilton24.now.sh/api/account/editOwnInfo", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            if let error = response.error {
                print(error)
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                let didUpdate = jsonDict["success"] as? String
                print(didUpdate)
                completion(didUpdate, nil)
            }
            
        }
        
    }
    
    
}
