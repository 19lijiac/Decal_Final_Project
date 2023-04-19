//
//  SwiftUIView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 26.50) {
            Text("LOG IN")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .frame(width: 159, height: 74)
            .tracking(1.20)

            VStack(spacing: 44) {
                    Text("EMAIL:")
                    .font(.subheadline)
                    .tracking(0.60)

                    Rectangle()
                    .frame(width: 281, height: 1)
            }
            .frame(width: 281, height: 61)

            VStack(spacing: 44) {
                    Text("PASSWORD:")
                    .font(.subheadline)
                    .tracking(0.60)

                    Rectangle()
                    .frame(width: 281, height: 1)
            }
            .frame(width: 281, height: 61)

            Text("FORGOT PASSWORD?")
            .font(.caption2)
            .tracking(0.40)

            Text("LOG IN")
            .fontWeight(.medium)
            .font(.title3)
            .tracking(0.72)
            .padding(.leading, 107)
            .padding(.trailing, 111)
            .padding(.top, 16)
            .padding(.bottom, 15)
            .frame(width: 278, height: 52)
            .background(Color.black)
            .cornerRadius(10)
        }
        .padding(.leading, 22)
        .padding(.trailing, 59)
        .padding(.top, 43)
        .padding(.bottom, 436)
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
