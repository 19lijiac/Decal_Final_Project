//
//  ContentView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var logInStatus: Bool
    @Binding var getStartedStatus: Bool
    
    
    var body: some View {
        VStack {
            VStack{
                ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .frame(width: 100, height: 100)
                            Image("AppIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
//                RoundedRectangle(cornerRadius: 8)
//                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
//                    .frame(width: 100, height: 100)
//                    .overlay(
//                            Image("AppIcon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                        )
                
                Text("DISCOVER THE WORLD")
                    .font(.title3)
                    .tracking(0.72)
            }.padding(.bottom, 100)
            
            Spacer()

            
            Button(action: {logInStatus.toggle()}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 316, height: 68)
                    
                    Text("LOG IN")
                        .fontWeight(.black)
                        .font(.title3)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 141, height: 72)
                        .tracking(0.72)
                }.frame(width: 316, height: 72)
            }

           
            
            Button(action : {getStartedStatus.toggle()}) {
                ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 316, height: 68)

                        Text("GET STARTED")
                        .fontWeight(.black)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 141, height: 72)
                        .tracking(0.72)
                }
                .frame(width: 316, height: 72)
            }

            
        }
        .padding(.vertical, 150)
        .padding(.horizontal, 40)
        .background(Image("Cover").resizable())
        
    }
}
