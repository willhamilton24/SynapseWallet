//
//  SetHandle.swift
//  Synapse
//
//  Created by Will Hamilton on 10/7/19.
//  Copyright © 2019 Comitatus Capital. All rights reserved.
//

import SwiftUI

struct SetHandle: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var handle: String = ""
    @State private var isTaken: Bool = false
    
    var body: some View {
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)

            VStack {
                
                Spacer().frame(height:235)
                
                VStack (spacing: 0){
                    GettingStartedText()
                    
                    VStack {
                        Text("Choose Handle").foregroundColor(CustomColors().light).font(Font.custom("Roboto-Light", size: 35)).padding(.bottom, 30)
                        
                        
                        
                        TextField("  Your Handle", text: $handle)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(CustomColors().primeGradiant, lineWidth: 1)
                                    .padding(.horizontal, 25)
                            ).foregroundColor(CustomColors().light)
                    
                        
                        //Spacer().frame(height: 60)
                        
                        Text("This is how other users will see you.")
                            .padding(.horizontal, 50)
                            .font(.custom("Roboto-Thin", size:18))
                            .lineLimit(3)
                            .foregroundColor(CustomColors().light)
                        
                        HStack (spacing: 15){
                            if (self.handle.count >= 4 && self.handle.count <= 24) {
                               Image("dot").resizable().frame(width: 28, height: 28).background(Color.green).cornerRadius(30)
                           } else {
                                Image("dot").resizable().frame(width: 28, height: 28).background(Color.red).cornerRadius(30)
                            }
                            
                            Text("Length: 4-24 Characters").foregroundColor(CustomColors().light)
                        }.offset(x: -64, y: 0.0)
                        
                        HStack (spacing: 15){
                            if self.viewRouter.users.contains(self.handle) {
                                Image("dot").resizable().frame(width: 28, height: 28).background(Color.red).cornerRadius(30)
                            } else {
                                 Image("dot").resizable().frame(width: 28, height: 28).background(Color.green).cornerRadius(30)
                            }
                             
                             Text("Handle is Available").foregroundColor(CustomColors().light)
                        }.offset(x: -87, y: 0.0)
                    }
                    
                    Spacer().frame(height: 70)
                    
                    VStack (spacing: 12) {
                        Button(action: {
                            self.viewRouter.currentPage = "keep-logs"
                            self.viewRouter.handle = "\(self.handle)"
                            // Add No Handle Error
                        }) {
                            Text("Next").padding().font(.custom("Roboto-Thin", size:30)).foregroundColor(CustomColors().light)
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .background(CustomColors().primeGradiant)
                            .cornerRadius(40)
                        .padding()
                            .foregroundColor(CustomColors().light)
                            .padding(.vertical, 0)
                        
                        Button(action: {
                            self.viewRouter.currentPage = "welcome"
                        }) {
                            Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                        }.frame(minWidth: 225, maxWidth: 250)
                            .background(CustomColors().primeGradiant)
                                .cornerRadius(40)
                            .padding()
                            .padding(.vertical, 0)
                                .foregroundColor(CustomColors().light)
                    }//.position(x: 210, y:300)
                    
                    //Spacer().frame(height: 70)
                }.background(CustomColors().dark)
            
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct SetHandle_Previews: PreviewProvider {
    static var previews: some View {
        SetHandle(viewRouter: ViewRouter())
    }
}
