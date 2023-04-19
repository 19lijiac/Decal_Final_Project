//
//  SearchView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 28.50) {
            Text("FRIEND LIST")
            .font(.largeTitle)
            .tracking(1.20)
            .padding(.leading, 96)
            .padding(.trailing, 95)
            .padding(.top, 39)
            .padding(.bottom, 37)
            .frame(width: 390, height: 110)
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))

            Text("SEARCH")
            .font(.subheadline)
            .tracking(0.60)
            .padding(.leading, 130)
            .padding(.trailing, 131)
            .padding(.top, 12)
            .padding(.bottom, 11)
            .frame(width: 325, height: 40)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            .frame(width: 325, height: 40)

            HStack(spacing: 32) {
                    Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 58, height: 52)

                    Text("BOB")
                    .font(.title3)
                    .tracking(0.80)
            }
            .frame(width: 135, height: 52)

            HStack(spacing: 32) {
                    Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 58, height: 52)

                    Text("BOB")
                    .font(.title3)
                    .tracking(0.80)
            }
            .frame(width: 135, height: 52)

            HStack(spacing: 32) {
                    Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 58, height: 52)

                    Text("BOB")
                    .font(.title3)
                    .tracking(0.80)
            }
            .frame(width: 135, height: 52)
        }
        .padding(.bottom, 424)
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
