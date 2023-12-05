//
//  AchivmentPop.swift
//  CenoApp
//
//  Created by Sara AlQuwaifli on 05/12/2023.
//

import SwiftUI

struct AchivmentPop: View {
    @State private var isButtonTapped = false

        var body: some View {
            VStack {
                if isButtonTapped {
                    NextView()
                        .transition(.opacity)
                } else {
                    FrontCardView(buttonAction: {
                        isButtonTapped.toggle()
                    })
                }
            }
            .padding()
        }
    }

    struct FrontCardView: View {
        var buttonAction: () -> Void

        var body: some View {
            Rectangle()
                .foregroundColor(Color.white.opacity(0.55))
                .frame(width: 330, height: 380)
                .background(Color.white)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.55), radius: 4.6, x: 0, y: 0)
                .overlay(
                    VStack(spacing: 38) {
                        Text("Congratulations on your incredible success!")
                            .bold()
                            .font(.system(size: 25))
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                        Image("Badge")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .shadow(radius: 5)

                        Button(action: {
                            buttonAction()
                        }) {
                            Text("Okay")
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 227, height: 50)
                                .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                                .cornerRadius(10)
                        }
                        .opacity(1)
                    }
                )
        }
    }

    struct NextView: View {
        var body: some View {
//            NavigationLink()
            Text("Next View")
                .bold()
                .font(.system(size: 25))
                .foregroundColor(.white)
        }
    }

#Preview {
    AchivmentPop()
}
