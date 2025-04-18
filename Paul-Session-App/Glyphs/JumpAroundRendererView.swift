//
//  JumpAroundRendererView.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct JumpAroundRendererView: View {
    @State private var moveAmount = 0.0
    
    var body: some View {
        Text("This is an ***important*** string with lots of text inside.")
            .font(.system(size: 96))
            .lineSpacing(50)
            .textRenderer(
                JumpAroundRenderer(
                    moveAmount: moveAmount
                )
            )
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    moveAmount = 10
                }
            }
    }
}

#Preview {
    JumpAroundRendererView()
}
