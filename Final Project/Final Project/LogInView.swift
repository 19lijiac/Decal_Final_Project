//
//  SwiftUIView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct LogInView: View {
    @State var email = ""
    @State var password = ""
    @Binding var mainPageStatus: Bool
    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                Text("LOG IN")
                    .font(.largeTitle)
                    .tracking(1.20)
                    .padding(.horizontal, 30)
                
                
                TextField("Email", text: $email)
                                .padding(.horizontal, 30)
                            Divider()
                                .padding(.horizontal, 30)
                    
                
                TextField("Password", text: $password)
                                .padding(.horizontal, 30).padding(.top, 20)
                            Divider()
                                .padding(.horizontal, 30)
                
                Text("FORGOT PASSWORD?")
                    .font(.caption2)
                    .tracking(0.40)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 30)
            }.padding(.bottom, 40)
                .padding(.top, 40)
            
            
            Button(action: {mainPageStatus.toggle()}) {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 316, height: 50)
                    
                    Text("LOG IN")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .tracking(0.72)
                }
            }
        }
        .padding(.bottom, 450)
        .background(Color.white)
        
        
        
    }
}
