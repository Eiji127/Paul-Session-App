//
//  HighlightRenderer.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct HighlightRenderer: TextRenderer {
    /// ハイライトさせたい色
    var color: Color

    /// Highlightがカスタム属性として設定されたテキストをハイライト描画する。
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
                if run[Highlight.self] != nil {
                    ctx.fill(
                        Rectangle()
                            .path(in: run.typographicBounds.rect),
                        with: .color(color)
                    )
                }
            }
        }
    }
}

struct Highlight: TextAttribute {}
