//
//  ReloadProfileButtons.swift
//  Synapse
//
//  Created by Will Hamilton on 10/25/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct ReloadProfileButtons: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    func base64Convert(base64String: String?) -> UIImage{
      if (base64String?.isEmpty)! {
          return UIImage()
      } else {
          // !!! Separation part is optional, depends on your Base64String !!!
          let temp = base64String?.components(separatedBy: ",")
          let dataDecoded : Data = Data(base64Encoded: temp![0], options: .ignoreUnknownCharacters)!
          let decodedimage = UIImage(data: dataDecoded)
          return decodedimage!
      }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Synapse")
                Text("Wallet.")
            }
            .font(Font.custom("Roboto-Thin", size: 45))
            .foregroundColor(CustomColors().light)
            .padding(.trailing, 45)
            
            Button(action: {
                NetworkingClient().getBalances(username: self.viewRouter.handle, token: self.viewRouter.token) { (json2, error) in
                    if json2 != nil {
                        print("Balance Retrieved")
                        if let btc = json2!["btc"] as? Double {
                            self.viewRouter.balances.btc = btc
                        }
                        if let eth = json2!["eth"] as? Double {
                            self.viewRouter.balances.eth = eth
                        }
                        if let ltc = json2!["ltc"] as? Double {
                            self.viewRouter.balances.ltc = ltc
                        }
                        self.viewRouter.currentPage = "main"
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "BTC") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.btc = adjustedPrice
                            self.viewRouter.accountValues.btc = self.viewRouter.prices.btc * self.viewRouter.balances.btc
                            self.viewRouter.accountValues.btc = round(100.0 * self.viewRouter.accountValues.btc) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "ETH") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.eth = adjustedPrice
                            self.viewRouter.accountValues.eth = self.viewRouter.prices.eth * self.viewRouter.balances.eth
                            self.viewRouter.accountValues.eth = round(100.0 * self.viewRouter.accountValues.eth) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                    CoinbaseMarketData().getQuote(currency: "LTC") { (price, error) in
                        if error != nil {
                            print(error)
                        } else if price != nil {
                            let adjustedPrice = price! * 0.97
                            self.viewRouter.prices.ltc = adjustedPrice
                            self.viewRouter.accountValues.ltc = self.viewRouter.prices.ltc * self.viewRouter.balances.ltc
                            self.viewRouter.accountValues.ltc = round(100.0 * self.viewRouter.accountValues.ltc) / 100.0
                        } else {
                            print("no dice")
                        }
                    }
                    
                }
                
            }) {
                Image("reload")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundColor(CustomColors().light)

            }
            .padding(.trailing)
            
            //Profile Button
            Button(action: {
                self.viewRouter.currentPage = "loading"
                NetworkingClient().getMyProfileInfo(username: self.viewRouter.handle, token: self.viewRouter.token) { (json, error) in
                    if error != nil { self.viewRouter.currentPage = "persist"}
                    if json != nil {
                        let unwrappedJSON = json!
                        self.viewRouter.profileInfo.email = unwrappedJSON.email!
                        self.viewRouter.profileInfo.joined = unwrappedJSON.joined!
                        if unwrappedJSON.name != "" {
                            self.viewRouter.profileInfo.name = unwrappedJSON.name!
                        }
                        if unwrappedJSON.profile_pic != nil {
                            self.viewRouter.profileInfo.profilePic = unwrappedJSON.profile_pic!
                            self.viewRouter.image = self.base64Convert(base64String: self.viewRouter.profileInfo.profilePic)
                        }
                        if unwrappedJSON.location != nil {
                            self.viewRouter.profileInfo.location = unwrappedJSON.location!
                        }
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .medium
                        dateFormatter.timeStyle = .none
                        
                        dateFormatter.locale = Locale(identifier: "en_US")
                        let joinDateRaw = Date(timeIntervalSince1970: self.viewRouter.profileInfo.joined / 1000)
                        
                        self.viewRouter.joinDate = dateFormatter.string(from: joinDateRaw)
                        
                        self.viewRouter.currentPage = "profile"
                    }
                }
                
                
            }){
                Image("profile")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundColor(CustomColors().light)
            }
        }
    }
}

struct ReloadProfileButtons_Previews: PreviewProvider {
    static var previews: some View {
        ReloadProfileButtons().environmentObject(ViewRouter())
    }
}
