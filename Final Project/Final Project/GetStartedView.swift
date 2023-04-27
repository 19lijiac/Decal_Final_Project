//
//  GetStartedView.swift
//  Final Project
//
//  Created by Andy Li on 4/23/23.
//

import SwiftUI
import Firebase

struct GetStartedView: View {
    @State var email = ""
    @State var password = ""
    @State var retypePassword = ""
    @State private var isPasswordRight = false
    @State private var isPasswordShort = false
    @State private var isEmailInvalid = false
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
            
            
            Button(action: handleRegister) {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 316, height: 50)
                    
                    Text("REGISTER")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tracking(0.72)
                }
            }.alert("Passwords don't match", isPresented: $isPasswordRight, actions: {Button ("OK", role: .cancel) {}})
            .alert("Password too short", isPresented: $isPasswordShort, actions: {Button ("OK", role: .cancel) {}},
                   message:{Text("must be 6 characters long or more")})
            .alert("Email format invalid", isPresented: $isEmailInvalid, actions: {Button ("OK", role: .cancel) {}},
                   message:{Text("The email address is badly formatted")})
            
        }
        .padding(.top, 10)
        .padding(.bottom, 150)
        .background(Color.white)
    }
    
    
    //handles the action of the Register button
    func handleRegister() {
        if self.password != self.retypePassword {
            print("Error - Passwords don't match")
            isPasswordRight = true
            return
        }
        
        if self.password.count < 6 {
            print("Error - The password must be 6 characters long or more")
            isPasswordShort = true
            return
        }
         
        
        Auth.auth().createUser(withEmail: self.email, password: self.password) {result, error in
            if let error = error {
                if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                    switch errorCode {
                    case .invalidEmail:
                        isEmailInvalid = true
                    default:
                        print(error.localizedDescription)
                    }
                }
                return
            }
            
            if !isEmailInvalid {
                navigationManager.goToLoginView()
            }
        }
    }
}


