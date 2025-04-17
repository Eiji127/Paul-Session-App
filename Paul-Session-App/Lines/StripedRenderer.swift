//
//  StripedRenderer.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct StripedRenderer: TextRenderer {
    /// インデックスが偶数の場合は透明度を0.35にし、奇数の場合は1.0にする。
    ///
    /// - Parameters:
    ///   - layout: レンダリングするテキストレイアウト
    ///   - ctx: テキストの描画するためのグラフィックスコンテキスト
    func draw(
        layout: Text.Layout,
        in ctx: inout GraphicsContext
    ) {
        for (i, line) in layout.enumerated() {
            if i.isMultiple(of: 2) {
                ctx.opacity = 0.35
            } else {
                ctx.opacity = 1.0
            }
            ctx.draw(line)
        }
    }
}
