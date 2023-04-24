//
//  GetStartedView.swift
//  Final Project
//
//  Created by Andy Li on 4/23/23.
//

import SwiftUI

struct GetStartedView: View {
    @State var email = ""
    @State var password = ""
    @State var retypePassword = ""
    @ObservedObject var navigationManager: ViewNavigationManager
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                Text("SIGN UP")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .tracking(1.20)
                    .padding(.horizontal, 30)
                
                
                TextField("Email", text: $email)
                    .focused($isTextFieldFocused)
                    .onAppear{isTextFieldFocused = true}
                                .padding(.horizontal, 30)
                                .foregroundColor(.black)
                            Divider()
                                .padding(.horizontal, 30)
                    
                
                TextField("Password", text: $password)
                                .padding(.horizontal, 30).padding(.top, 20)
                                .foregroundColor(.black)
                            Divider()
                                .padding(.horizontal, 30)
                
                TextField("Retype Password", text: $retypePassword)
                                .padding(.horizontal, 30).padding(.top, 20)
                                .foregroundColor(.black)
                            Divider()
                                .padding(.horizontal, 30)
                
                
            }.padding(.bottom, 40)
                .padding(.top, 40)
            
            
            Button(action: navigationManager.goToMainFrameView) {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 316, height: 50)
                    
                    Text("REGISTER")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tracking(0.72)
                }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 150)
        .background(Color.white)
        
        
        
    }
}
