//
//  JumpAroundRenderer.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct JumpAroundRenderer: TextRenderer {

    var moveAmount: Double
    
    var animatableData: Double {
        get { moveAmount }
        set { moveAmount = newValue }
    }

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
                for glyph in run {
                    let yOffset = Double.random(
                        in: -moveAmount...moveAmount
                    )
                    // コンテキストをコピーして、Y軸方向にオフセットを適用する。
                    // これにより、元のコンテキストは変更されず、オフセットされたコピーが描画される。
                    var copy = ctx
                    copy.addFilter(
                        .blur(radius: moveAmount / 4)
                    )
                    copy.translateBy(x: 0, y: yOffset)
                    copy.draw(glyph)
                }
            }
        }
    }
}
