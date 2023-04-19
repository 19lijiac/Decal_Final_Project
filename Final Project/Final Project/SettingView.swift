//
//  SettingView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("SETTINGS")
            .font(.largeTitle)
            .tracking(1.20)
            .padding(.horizontal, 118)
            .padding(.top, 39)
            .padding(.bottom, 37)
            .frame(width: 390, height: 110)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))

            HStack(spacing: 23) {
                    VStack(spacing: 6) {
                                RoundedRectangle(cornerRadius: 24)
                                .fill(Color(red: 1, green: 0.80, blue: 0.08))
                                .frame(width: 24, height: 24)

                                RoundedRectangle(cornerRadius: 90)
                                .fill(Color(red: 1, green: 0.80, blue: 0.08))
                                .frame(maxWidth: .infinity, maxHeight: 90)
                    }
                    .padding(.top, 10)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)

                    Text("TOM")
                    .font(.largeTitle)
                    .tracking(1.20)
            }
            .padding(.vertical, 8)
            .padding(.leading, 10)
            .padding(.trailing, 159)
            .frame(width: 319, height: 76)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 10.88) {
                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 28, height: 25)

                Rectangle()
                .frame(width: 279, height: 1)

                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 28, height: 25)

                Rectangle()
                .frame(width: 279, height: 1)

                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 28, height: 25)

                Rectangle()
                .frame(width: 279, height: 1)

                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 28, height: 25)

                Rectangle()
                .frame(width: 279, height: 1)

                RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 28, height: 25)
            }
            .padding(.leading, 18)
            .padding(.top, 6)
            .padding(.bottom, 10)
            .frame(width: 318, height: 232)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            .frame(width: 318, height: 232)
        }
        .padding(.bottom, 362)
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
