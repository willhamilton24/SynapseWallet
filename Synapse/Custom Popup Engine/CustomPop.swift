//
//  CustomPop.swift
//  Synapse
//
//  Created by Will Hamilton on 12/18/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct CustomPop: View {
    @State var active: Bool
    @State var heading: String
    @State var content: String
    
    var body: some View {
        ZStack {
            Text("")
                .frame(width: 500, height: 1000)
                .background(CustomColors().dark)
                .opacity(active ? 0.5 : 0.0)
            
            
            
            VStack (spacing: 0) {
                if active {
                    Button(action: {self.active = false}) {
                        Image("x")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                    }.offset(x:-150, y: -200)
                }
                
                Text("ALERT")
                    .font(Font.custom("Roboto-Thin", size:76))
                    .offset(y:-70)
                    .foregroundColor(CustomColors().lg)
                VStack (spacing: 0) {
                    VStack {
                        Text(heading)
                            .padding(.top, 8)
                            .font(Font.custom("Roboto-Light", size:20))
                        Divider().padding(.bottom, 0)
                    }
                    .background(CustomColors().light2)
                    .padding(.bottom, 0)
                    
                    
                    Text(content)
                        .padding(.vertical, 25)
                        .font(Font.custom("Roboto-Thin", size:14))
                        .frame(width: 250)
                        .background(Color.white)
                        
                    
                        if active {
                            Button(action: {self.active = false}) {
                                VStack (spacing: 0){
                                    Divider()
                                    Text("OK")
                                        .padding(.vertical, 5)
                                        .font(Font.custom("Roboto-Light", size:34))
                                        .foregroundColor(Color.white)
                                }
                            }
                            .background(CustomColors().lg)
                        }
                    
                }
                .frame(width: 250)
                .cornerRadius(20)
                .padding(.vertical, 0)
                .offset(y: -70)
                
                
            }
            
            
        }.opacity(active ? 1.0 : 0.0)
    }
}

struct CustomPop_Previews: PreviewProvider {
    static var previews: some View {
        CustomPop(active: true, heading: "Verification Code Sent", content: "Have a Nice Day!!")
    }
}
