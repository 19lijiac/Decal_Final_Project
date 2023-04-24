//
//  ContentView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var navigationManager: ViewNavigationManager
    
    
    var body: some View {
        VStack {
            VStack{
                    /*
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                        .frame(width: 100, height: 100)
                     */
                Image("AppIconRef")
                    .resizable().frame(width: 100, height: 100)
                    .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(radius: 10)
                        
                            
                
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
                    .font(Font.custom("Bradley Hand", size:24))
                    .tracking(0.7)
            }.padding(.bottom, 100)
            
            Spacer()

            //Press the button and go to logIn view
            Button(action: navigationManager.goToLoginView) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 275, height: 50)
                    
                    Text("LOG IN")
                        .fontWeight(.black)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 72)
                        .tracking(0.72)
                }.frame(width: 316, height: 72)
            }

           
            //Press the button and go to getStartedView
            Button(action : navigationManager.goToGetStartedView) {
                ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .frame(width: 275, height: 50)

                        Text("GET STARTED")
                        .fontWeight(.black)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 72)
                        .tracking(0.72)
                }
                .frame(width: 316, height: 72)
            }

            
        }
        .padding(.vertical, 150)
        .padding(.horizontal, 40)
        .background(Image("Cover").resizable().ignoresSafeArea())
        
    }
}
