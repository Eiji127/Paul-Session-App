//
//  RainbowGradientEffectView.swift.swift
//  Paul-Session-App
//
//  Created by 白数叡司 on 2025/04/18.
//

import SwiftUI

struct RainbowGradientAttribute: TextAttribute { }

struct RainbowGradientRenderer: TextRenderer {
    var xOffset: Double

    var animatableData: Double {
        get { xOffset }
        set { xOffset = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                if run[RainbowGradientAttribute.self] != nil {
                    var copy = context

                    copy.addFilter(
                        .colorShader(
                            ShaderLibrary.rainbowGradient(
                                .float2(run.typographicBounds.rect.size),
                                .float(xOffset)
                            )
                        )
                    )

                    copy.draw(run)
                } else {
                    context.draw(run)
                }
            }
        }
    }
}

struct RainbowGradientEffectView: View {
    @State private var xOffset = 0.0

    var body: some View {
        VStack {
            Text("Yappli\nmobile tech for all")
                .customAttribute(RainbowGradientAttribute())
                .font(.system(size: 72))
                .lineSpacing(40)
                .multilineTextAlignment(.center)
                .textRenderer(RainbowGradientRenderer(xOffset: xOffset))
        }
        .navigationSubtitle("Rainbow Gradient")
        .padding()
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                xOffset = 1
            }
        }
    }
}

#Preview {
    RainbowGradientEffectView()
}
