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
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertText: String = ""
    
    var body: some View {
        ZStack {
            BigLogo().frame(width: 500, height: 240).position(x: 180, y: 80)

            VStack {
                
                Spacer().frame(height:235)
                
                //VStack (spacing: 0){
                    //GettingStartedText()
                    
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
                    
                        
                        
                        
                        Text("This is how other users will see you.")
                            .padding(.horizontal, 50)
                            .font(.custom("Roboto-Thin", size:18))
                            .lineLimit(3)
                            .foregroundColor(CustomColors().light)
                        
                        Spacer().frame(height: 30)
                        
                        HStack (spacing: 15){
                            if (self.handle.count >= 4 && self.handle.count <= 24) {
                               Image("check").resizable()
                                .frame(width: 28, height: 28)
                                .background(CustomColors().prime2)
                                .cornerRadius(30)
                                .foregroundColor(CustomColors().light)
                           } else {
                                Image("x").resizable().frame(width: 28, height: 28).background(CustomColors().prime).cornerRadius(30)
                            }
                            
                            Text("Length: 4-24 Characters")
                        }.offset(x: -64, y: 0.0).foregroundColor(CustomColors().light)
                        
                        HStack (spacing: 15){
                            if self.viewRouter.users.contains(self.handle) {
                                Image("x").resizable().frame(width: 28, height: 28).background(CustomColors().prime).cornerRadius(30)
                            } else {
                                 Image("check").resizable()
                                 .frame(width: 28, height: 28)
                                 .background(CustomColors().prime2)
                                 .cornerRadius(30)
                                 .foregroundColor(CustomColors().light)
                            }
                             
                             Text("Handle is Available")
                        }.offset(x: -87, y: 0.0).foregroundColor(CustomColors().light)
                    }
                    
                    //Spacer().frame(height: 70)
                    
                    VStack (spacing: 4) {
                        Button(action: {
                            if ( (self.handle.count >= 4 && self.handle.count <= 24) && self.viewRouter.users.contains(self.handle) != true) {
                                self.viewRouter.currentPage = "keep-logs"
                                self.viewRouter.handle = self.handle
                            } else if (self.viewRouter.users.contains(self.handle)) {
                                self.alertTitle = "Handle Taken"
                                self.alertText = "This handle has already been registered. Please choose a different one."
                                self.showAlert = true
                            } else {
                                self.alertText = "Your handle must be between 4 and 24 charaters in length. Please choose a different one."
                                if (self.handle.count < 4) {
                                    self.alertTitle = "Handle Too Short"
                                } else {
                                    self.alertTitle = "Handle Too Long"
                                }
                                self.showAlert = true
                            }
                        }) {
                            Text("Next").padding().font(Font.custom("Roboto-Thin", size:35)).foregroundColor(CustomColors().light)
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .background(CustomColors().lg)
                            .cornerRadius(30)
                        .padding()
                            .foregroundColor(CustomColors().light)
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text(self.alertTitle), message: Text(self.alertText), dismissButton: .default(Text("Got it!")))
                            }
                        
                        Button(action: {
                            self.viewRouter.currentPage = "welcome"
                        }) {
                            Text("Back").padding().font(.custom("Roboto-Thin", size:20)).foregroundColor(CustomColors().light)
                        }.frame(minWidth: 225, maxWidth: 250)
                            .background(CustomColors().lg)
                                .cornerRadius(25)
                            .padding()
                            .padding(.vertical, 0)
                                .foregroundColor(CustomColors().light)
                    }//.position(x: 210, y:300)
                    
                    //Spacer().frame(height: 70)
                //}.background(CustomColors().dark).edgesIgnoringSafeArea(.bottom)
            
            }
        }.edgesIgnoringSafeArea(.bottom).background(CustomColors().dark)
    }
}

struct SetHandle_Previews: PreviewProvider {
    static var previews: some View {
        SetHandle(viewRouter: ViewRouter())
    }
}
