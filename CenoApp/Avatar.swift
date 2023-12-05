//
//  Avatar.swift
//  CenoApp
//
//  Created by Sara AlQuwaifli on 05/12/2023.
//

import SwiftUI

struct Testing: View {
    let avatars = ["Ceno2", "Ceno3", "Ceno1"]
    @State private var selectedAvatar = "Ceno3"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollView in
                HStack(spacing: 10) {
                    
                    ForEach(avatars, id: \.self) { avatar in
                        Button {
                            withAnimation(.linear(duration: 0.5)) {
                                selectedAvatar = avatar
                            }
                        } label: {
                            AvatarView(imageName: avatar, isSelected: selectedAvatar == avatar) {
                                selectedAvatar = avatar
                                scrollView.scrollTo(selectedAvatar, anchor: .center)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 26)
                        .fill(Color("Back"))
                )
                .onAppear {
                    scrollView.scrollTo(selectedAvatar, anchor: .center)
                }
            }
        }
    }
}


struct Avatar: View {
    @State private var selectedAvatar = "Ceno3"
    
    var body: some View {
        ZStack {
            VStack(spacing: 45)                                                                                                                                                                                                                         {
                Text("Choose your Avatar!")
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(alignment: .top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { scrollView in
                        HStack(spacing: 20) {
                            ForEach(["Ceno2", "Ceno3", "Ceno1"], id: \.self) { avatar in
                                AvatarView(imageName: avatar, isSelected: selectedAvatar == avatar) {
                                    selectedAvatar = avatar
                                    scrollView.scrollTo(selectedAvatar, anchor: .center)
                                }
                            }
                        }
                        .padding (.vertical,10)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 26)
                                .fill(Color("Back"))
                        )
                        .onAppear {
                            scrollView.scrollTo(selectedAvatar, anchor: .center)
                        }
                    }
                }
                .padding()
                
                Button(action: {

                }) {
                    Text("Next")
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 227, height: 50)
                        .background(Color(red: 0.23, green: 0.23, blue: 0.58))
                        .cornerRadius(10)
                }
                .opacity(1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Back"))
        }
    }
}

struct AvatarView: View {
    var imageName: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        Rectangle()
            .foregroundColor(isSelected ? .white.opacity(0.55) : .clear)
            .frame(width: 280, height: 417)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.20), radius: 4.6, x: 0, y: 0)
            .shadow(color: isSelected ? .black.opacity(0.30) : .clear, radius: 4.6, x: 0, y: 0)
            .overlay(
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
            )
           
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    Avatar()
}
