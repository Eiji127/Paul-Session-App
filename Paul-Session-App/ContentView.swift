//
//  ContentView.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    NavigationLink("✅ Based Markdown") {
                        NormalMarkdownView()
                    }
                    NavigationLink("✅ Set StripedRenderer to Lines.") {
                        StripedRendererView()
                    }
                } header: {
                    Text("Custom Lines")
                }

                Section {
                    NavigationLink("⛔️ Only Set Highlight Attribute to the text.") {
                        // .customAttribute()を利用したとしてもカスタム属性を使用してコンテンツをマークするのみとなる。
                        // 画面上の表示方法の変更は常にTextRendererに準拠する型を使用する必要がある。
                        HighlightAttributeView()
                    }

                    NavigationLink("✅ Set HighlightRenderer to Runs.") {
                        HighlightRendererView()
                    }
                } header: {
                    Text("Custom Runs")
                }

                Section {
                    NavigationLink("✅ Set WaveRenderer to Glyphs.") {
                        WaveRendererView()
                    }

                    NavigationLink("✅ Set JumpAroundRenderer to Glyphs.") {
                        JumpAroundRendererView()
                    }
                } header: {
                    Text("Custom Glyphs")
                }

                Section {
                    NavigationLink("✅ Set Perspective Effect to Text.") {

                    }
                } header: {
                    Text("Use Metal")
                }
            }
        } detail: {
            VStack {
                Text("A collection of `TextRenderer` effects for SwiftUI.")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
