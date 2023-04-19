//
//  ProfileView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black).rotationEffect(.degrees(180))
                .frame(maxWidth: .infinity, maxHeight: 24)

                RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                .frame(width: 12, height: 23)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
            }
            .padding(.trailing, 7)
            .padding(.bottom, 1)
            .frame(width: 24, height: 24)
            .frame(width: 24, height: 24)

            ZStack {
                    Rectangle()
                    .fill(Color(red: 0.67, green: 0.13, blue: 0.78))
                    .offset(x: -16, y: -2)
                    .frame(width: 30, height: 60)

                    Rectangle()
                    .fill(Color(red: 0.39, green: 0.13, blue: 0.36))
                    .offset(x: -1, y: 13)
                    .frame(width: 60, height: 30)
            }
            .frame(width: 62, height: 64)
            .background(Color.white)

            Text("BOB")
            .font(.largeTitle)
            .tracking(1.20)

            VStack() {
                    Text("CURRENT LOCATION:")
                    .font(.title3)
                    .tracking(0.80)

                    Text("SF")
                    .font(.title3)
                    .tracking(0.80)
            }
            .padding(.leading, 17)
            .padding(.trailing, 20)
            .padding(.top, 21)
            .padding(.bottom, 10)
            .frame(width: 257, height: 93)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))

            Text("RECENT STORIES")
            .font(.title3)
            .tracking(0.80)

            Rectangle()
            .frame(width: 179, height: 1)

            VStack(spacing: 26) {
                    Rectangle()
                    .fill(Color.white)
                    .frame(width: 233, height: 137)

                    Rectangle()
                    .fill(Color.white)
                    .frame(width: 233, height: 82)
            }
            .padding(.leading, 26)
            .padding(.trailing, 27)
            .padding(.top, 22)
            .frame(width: 286, height: 267)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)

            ZStack {
                    Rectangle()
                    .fill(Color(red: 0.56, green: 0.49, blue: 0.82))
                    .offset(x: -15, y: 0)
                    .frame(width: 30, height: 60)

                    Rectangle()
                    .fill(Color(red: 0.09, green: 0.69, blue: 0.39))
                    .offset(x: 0, y: 15)
                    .frame(width: 60, height: 30)
            }
            .frame(width: 60, height: 60)
            .background(Color.white)
        }
        .padding(.leading, 39)
        .padding(.top, 24)
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
