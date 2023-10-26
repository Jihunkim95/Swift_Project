//
//  AppStoregeView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct AppStoregeView: View {
    @AppStorage("editorText") var editorText: String = "Sample Text"
    
    var body: some View {
        Text("AppStoregeView")
        TextEditor(text: $editorText)
            .padding()
            .font(.largeTitle)
    }
}

#Preview {
    AppStoregeView()
}
