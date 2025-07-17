//
//  ContentView.swift
//  globalleague
//
//  Created by june taylr on 7/16/25.
//


import SwiftUI

struct MainMenuView: View {
    @State private var topRowOffset: CGFloat = 0
    @State private var bottomRowOffset: CGFloat = 0
    
    let speed: CGFloat = 0.5
    let timer = Timer.publish(every: 0.015, on: .main, in: .common).autoconnect()
    
    let topFlags = ["usa", "nigeria", "france", "germany", "argentina"]
    let bottomFlags = ["mexico", "england", "spain", "brazil", "portugal"]
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.749, blue: 1, alpha: 1)) // #00BFFF
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 20)
                
                // 🏆 Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                
                Spacer().frame(height: 20)
                
                // 🇬 Top Flags Moving Left
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        HStack(spacing: 8) {
                            ForEach(topFlags, id: \.self) { name in
                                Image(name)
                                    .resizable()
                                    .frame(height: 40)
                            }
                        }
                        .offset(x: topRowOffset)
                        .onReceive(timer) { _ in
                            topRowOffset -= speed
                            if abs(topRowOffset) > geo.size.width {
                                topRowOffset = 0
                            }
                        }
                    }
                }
                .frame(height: 40)
                
                Spacer().frame(height: 30)
                
                // 🎮 Menu Buttons
                VStack(spacing: 16) {
                    menuButton("play now")
                    menuButton("my player")
                    menuButton("1 v world")
                    menuButton("practice")
                    menuButton("who you rep")
                    menuButton("settings")
                }
                .padding(.horizontal, 30)
                
                Spacer().frame(height: 10)
                
                // 🌍 Bottom Flags Moving Right
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        HStack(spacing: 8) {
                            ForEach(bottomFlags, id: \.self) { name in
                                Image(name)
                                    .resizable()
                                    .frame(height: 40)
                            }
                        }
                        .offset(x: bottomRowOffset)
                        .onReceive(timer) { _ in
                            bottomRowOffset += speed
                            if bottomRowOffset > geo.size.width {
                                bottomRowOffset = 0
                            }
                        }
                    }
                }
                .frame(height: 40)
                
                Spacer().frame(height: 20)
            }
        }
    }
    
    // 📦 Menu Button Builder
    func menuButton(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .scaleEffect(0.71) // Equivalent to Flutter's scale: 1.4
            .shadow(color: .black.opacity(0.26), radius: 8, x: 0, y: 4)
    }
}
