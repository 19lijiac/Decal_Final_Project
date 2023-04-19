//
//  MainFrameView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct MainFrameView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 89.46) {
            ZStack {
                    Ellipse()
                    .fill(Color.white)
                    .frame(width: 32, height: 32)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .frame(width: 20, height: 19)
            }
            .frame(width: 32, height: 32)

            ZStack {
                    Ellipse()
                    .fill(Color.white)
                    .frame(width: 32, height: 32)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .frame(width: 20, height: 19)
            }
            .frame(width: 32, height: 32)

            ZStack {
                Rectangle()
                .fill(Color(red: 0.65, green: 0.01, blue: 0.42))
                .offset(x: -5, y: 10)
                .frame(width: 30, height: 60)

                Rectangle()
                .fill(Color(red: 0.99, green: 0.22, blue: 0.01))
                .offset(x: 10, y: 25)
                .frame(width: 60, height: 30)
            }
            .frame(width: 40, height: 40)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.horizontal, 4)
            .padding(.top, 4)
            .padding(.bottom, 19)
            .frame(width: 48, height: 63.22)
            .background(Color(red: 1, green: 0.50, blue: 0))
            .cornerRadius(8)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 1, green: 0, blue: 0))
            .frame(width: 25, height: 22)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 1, green: 1, blue: 0))
            .frame(width: 19.25, height: 22)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0, green: 0, blue: 1))
            .frame(width: 22, height: 22)

            RoundedRectangle(cornerRadius: 8)
            .fill(Color.black)
            .frame(width: 35, height: 35)
            .padding(.vertical, 14)
            .padding(.leading, 75)
            .padding(.trailing, 77)
            .frame(width: 187, height: 63)
            .background(Color.white)
            .cornerRadius(30)
        }
        .padding(.leading, 91)
        .padding(.trailing, 23)
        .padding(.top, 14)
        .padding(.bottom, 37)
        .frame(width: 390, height: 844)
        .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
    }
}

struct MainFrameView_Previews: PreviewProvider {
    static var previews: some View {
        MainFrameView()
    }
}
