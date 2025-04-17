//
//  WaveRenderer.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct WaveRenderer: TextRenderer {
    var strength: Double
    var frequency: Double

    /// 波のようなテキストを描画する。
    ///
    /// - Parameters:
    ///   - layout: レンダリングするテキストレイアウト
    ///   - ctx: テキストの描画するためのグラフィックスコンテキスト
    func draw(
        layout: Text.Layout,
        in ctx: inout GraphicsContext
    ) {
        for line in layout {
            for run in line {
                for (i, glyph) in run.enumerated() {
                    let yOffset = strength * sin(Double(i) * frequency)
                    // コンテキストをコピーして、Y軸方向にオフセットを適用する。
                    // これにより、元のコンテキストは変更されず、オフセットされたコピーが描画される。
                    var copy = ctx
                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph)
                }
            }
        }
    }
}
