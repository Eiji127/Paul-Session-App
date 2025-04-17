//
//  JumpAroundRendererView.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct JumpAroundRendererView: View {
    var body: some View {
        Text("This is an ***important*** string with lots of text inside.")
            .font(.system(size: 96))
            .lineSpacing(50)
            .textRenderer(
                JumpAroundRenderer(
                    moveAmount: 20.0
                )
            )
    }
}

#Preview {
    JumpAroundRendererView()
}
