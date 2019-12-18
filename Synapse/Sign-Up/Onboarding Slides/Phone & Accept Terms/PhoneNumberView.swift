//
//  PhoneNumberView.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct PhoneNumberView: View {
    @State var userNumber: String = ""
    
    var body: some View {
        VStack (spacing: 0) {
            Text("Phone Number")
            .font(Font.custom("Roboto-Light", size: 36))
            .foregroundColor(CustomColors().lg)
            
            Spacer().frame(height: 20)
            
            Image("phone").resizable().frame(width: 70, height: 70)
            
            Spacer().frame(height: 20)
            
            VStack {
                PhoneInput(text: $userNumber)
                    .frame(width: 280, height: 40)
                    .font(Font.custom("Roboto-Light", size: 26))
                    .offset(x: 30)
                    

                
                Divider()
                    .frame(width: 320, height: 2)
                    .background(CustomColors().dark)
                
                //Text("please include area and country codes.").font(Font.custom("Roboto-Light", size: 14))
            }
            
            Spacer().frame(height: 40)
            
            HStack (spacing: 12) {
                CheckBoxWrapper().frame(width: 32, height: 32)
                VStack (alignment: .leading) {
                    Text("I have read and accept the").font(Font.custom("Roboto-Thin", size: 16))
                    HStack (spacing:4){
                        Button(action: {}) {
                            Text("Terms of Service").font(Font.custom("Roboto-Thin", size: 16))
                        }
                        
                        Text("and").font(Font.custom("Roboto-Thin", size: 16))
                        
                        Button(action: {}) {
                            Text("Privacy Policy").font(Font.custom("Roboto-Thin", size: 16))
                        }
                    }
                }
            }
            
            
            
        }.frame(width: 350, height: 350)
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView()
    }
}
