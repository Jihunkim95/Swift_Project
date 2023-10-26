//
//  SecondTabView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct SecondTabView: View {
    @State private var text: String = ""
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .onChange(of: text, perform: { value in
                print("onChange triggered")
            })
    }
}

#Preview {
    SecondTabView()
}
