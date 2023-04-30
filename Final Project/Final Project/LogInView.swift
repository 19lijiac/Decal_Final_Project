//
//  SwiftUIView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct LogInView: View {
    @State var email = ""
    @State var password = ""
    @State private var isUserNotFound = false
    @ObservedObject var navigationManager: ViewNavigationManager
    @FocusState private var isTextFieldFocused: Bool
    
    
    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                Text("LOG IN")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .tracking(1.20)
                    .padding(.horizontal, 30)
                
                
                TextField("Email", text: $email).focused($isTextFieldFocused).onAppear{isTextFieldFocused = true}.foregroundColor(.black)
                                .padding(.horizontal, 30)
                            Divider()
                                .padding(.horizontal, 30)
                
                    
                
                TextField("Password", text: $password)
                    .padding(.horizontal, 30).padding(.top, 20).foregroundColor(.black)
                            Divider()
                                .padding(.horizontal, 30)
                
                Button(action: navigationManager.goToGetStartedView) {
                    Text("Don't have an account yet?")
                }.font(.caption2)
                .tracking(0.40)
                .foregroundColor(.blue)
                .padding(.horizontal, 30)
            }.padding(.bottom, 40)
                .padding(.top, 40)
            
            
            Button(action: login) {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 316, height: 50)
                    
                    Text("LOG IN")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tracking(0.72)
                }
            }.alert("User Not Found", isPresented: $isUserNotFound, actions: {Button ("OK", role: .cancel) {}},
                    message:{Text("Please try again")})
        }
        .padding(.top, 10)
        .padding(.bottom, 150)
        .background(Color.white)
    }
    
    
    //handles Log In button
    func login() {
        Auth.auth().signIn(withEmail: self.email, password: self.password) {authResult, error in
            if let error = error {
                if let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                    switch errorCode {
                    case .userNotFound:
                        isUserNotFound = true
                    case .wrongPassword:
                        isUserNotFound = true
                    case .invalidEmail:
                        isUserNotFound = true
                    default:
                        print(error.localizedDescription)
                    }
                }
                return
            }
            
            if !isUserNotFound {
                guard let currentUser = Auth.auth().currentUser else {
                    return
                }
                FirebaseManager.shared.currentUser = currentUser
                navigationManager.goToMainFrameView()
            }
        }
        
        
    }
}
