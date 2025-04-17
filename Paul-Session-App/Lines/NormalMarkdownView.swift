//
//  NormalMarkdownView.swift
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

import SwiftUI

struct NormalMarkdownView: View {
    var body: some View {
        Text("This is an ***important*** string with lots of text inside.")
            .font(.system(size: 96))
            .lineSpacing(50)
    }
}

#Preview {
    NormalMarkdownView()
}
