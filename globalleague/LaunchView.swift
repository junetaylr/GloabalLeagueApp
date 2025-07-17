//
//  LaunchView.swift
//  globalleague
//
//  Created by june taylr on 7/16/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var navigate = false

    var body: some View {
        ZStack {
            if navigate {
                MainMenuView()
            } else {
                Image("intro")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                navigate = true
                            }
                        }
                    }
            }
        }
    }
}
