//
//  ContentView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 101) {
            ZStack {
                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .offset(x: -30.25, y: -0.87)
                    .frame(width: 31.25, height: 84.58)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .offset(x: 30.25, y: 0.87)
                    .frame(width: 31.25, height: 84.58)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .frame(width: 31.25, height: 86.33)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .offset(x: 15.50, y: 8.50)
                    .frame(width: 100, height: 100)
            }
            .frame(width: 99, height: 101)

            Text("DISCOVER THE WORLD")
            .font(.title3)
            .tracking(0.72)

            ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .offset(x: 0, y: -2)
                    .frame(width: 316, height: 68)

                    Text("LOG IN")
                    .fontWeight(.black)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(width: 141, height: 72)
                    .tracking(0.72)
            }
            .frame(width: 316, height: 72)

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
                    .offset(x: 2.50, y: 0)
            }
            .frame(width: 316, height: 72)
        }
        .padding(.horizontal, 37)
        .padding(.top, 89)
        .padding(.bottom, 187)
        .frame(width: 390, height: 844)
        .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
