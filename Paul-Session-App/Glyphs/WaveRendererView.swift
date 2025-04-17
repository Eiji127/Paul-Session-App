//
//  WaveRendererView.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct WaveRendererView: View {

    @State private var offsetAmount: Double = -20.0

    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }

    var body: some View {
        Text("This is an ***important*** string with lots of text inside.")
            .font(.system(size: 96))
            .lineSpacing(50)
            .textRenderer(
                WaveRenderer(
                    strength: offsetAmount,
                    frequency: 0.5
                )
            )
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    offsetAmount = 20.0
                }
            }
    }
}

#Preview {
    WaveRendererView()
}
