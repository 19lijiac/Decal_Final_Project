//
//  ChatView.swift
//  Final Project
//
//  Created by Michael Wu on 4/19/23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack(spacing: 220) {
            HStack(spacing: 104.50) {
                    VStack(spacing: 10582) {
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

                    Text("BOB")
                    .font(.largeTitle)
                    .tracking(1.20)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black)
                    .frame(width: 35, height: 33.01)
            }
            .padding(.horizontal, 27)
            .padding(.top, 20)
            .padding(.bottom, 17)
            .frame(width: 390, height: 71)
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))

            RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .frame(width: 335, height: 34)
            .padding(.leading, 6)
            .padding(.trailing, 50)
            .padding(.top, 5)
            .padding(.bottom, 4)
            .frame(width: 391, height: 43)
            .background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 0.50))
            .cornerRadius(8)

            VStack(spacing: 9.33) {
                    VStack(spacing: 12) {
                                HStack(spacing: 6) {
                                Group {
                                                Text("Q")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("W")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 32)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 32, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 32, height: 42)

                                                Text("E")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("R")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("T")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("Y")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("U")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("I")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("O")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 32)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 32, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 32, height: 42)

                                                Text("P")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)
                                }
                                }
                                .frame(width: 387, height: 42)

                                HStack(spacing: 6) {
                                                Text("A")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("S")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("D")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("F")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("G")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("H")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)

                                                Text("J")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("K")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 33)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 33, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 33, height: 42)

                                                Text("L")
                                                .font(.title2)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 34)
                                                .lineSpacing(28)
                                                .padding(.vertical, 7)
                                                .frame(width: 34, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 34, height: 42)
                                }
                                .frame(width: 349, height: 42)

                                HStack() {
                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.black)
                                                .frame(width: 19, height: 16.30)
                                                .padding(.vertical, 13)
                                                .padding(.leading, 12)
                                                .padding(.trailing, 11)
                                                .frame(width: 42, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 42, height: 42)

                                                HStack(spacing: 6) {
                                                                    Text("Z")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 34)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 34, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 34, height: 42)

                                                                    Text("X")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 32)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 32, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 32, height: 42)

                                                                    Text("C")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 34)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 34, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 34, height: 42)

                                                                    Text("V")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 35)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 35, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 35, height: 42)

                                                                    Text("B")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 33)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 33, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 33, height: 42)

                                                                    Text("N")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 33)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 33, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 33, height: 42)

                                                                    Text("M")
                                                                    .font(.title2)
                                                                    .multilineTextAlignment(.center)
                                                                    .frame(width: 34)
                                                                    .lineSpacing(28)
                                                                    .padding(.vertical, 7)
                                                                    .frame(width: 34, height: 42)
                                                                    .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                                    .cornerRadius(8)
                                                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                                    .frame(width: 34, height: 42)
                                                }
                                                .frame(width: 271, height: 42)

                                                RoundedRectangle(cornerRadius: 8)
                                                .fill(Color.white)
                                                .frame(width: 23, height: 17)
                                                .padding(.leading, 9)
                                                .padding(.trailing, 10)
                                                .padding(.top, 12)
                                                .padding(.bottom, 13)
                                                .frame(width: 42, height: 42)
                                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                                .cornerRadius(8)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                                .frame(width: 42, height: 42)
                                }
                                .frame(width: 387, height: 42)
                    }
                    .frame(width: 387, height: 150)

                    HStack(alignment: .top, spacing: 6) {
                                Text("123")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .frame(width: 91)
                                .lineSpacing(21)
                                .padding(.top, 11)
                                .padding(.bottom, 10)
                                .frame(width: 91, height: 42)
                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .cornerRadius(8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                .frame(width: 91, height: 42)

                                Text("space")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .frame(width: 193)
                                .lineSpacing(21)
                                .padding(.top, 11)
                                .padding(.bottom, 10)
                                .frame(width: 193, height: 42)
                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .cornerRadius(8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                .frame(maxWidth: .infinity, maxHeight: 42)

                                Text("return")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .frame(width: 91)
                                .lineSpacing(21)
                                .padding(.top, 11)
                                .padding(.bottom, 10)
                                .frame(width: 91, height: 42)
                                .background(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .cornerRadius(8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.30), radius: 0, y: 1)
                                .frame(width: 91, height: 42)
                    }
                    .frame(width: 387)

                    RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                    .frame(width: 331, height: 28)

                    RoundedRectangle(cornerRadius: 100)
                    .fill(Color.white)
                    .frame(width: 134, height: 5)
                    .padding(.horizontal, 129)
                    .padding(.top, 21)
                    .padding(.bottom, 8)
                    .frame(width: 392, height: 34)
            }
            .padding(.leading, 1)
            .padding(.top, 8)
            .frame(maxWidth: .infinity, maxHeight: 290)
            .background(Color(red: 0.19, green: 0.19, blue: 0.20))
        }
        .frame(width: 390, height: 844)
        .background(Color.white)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
