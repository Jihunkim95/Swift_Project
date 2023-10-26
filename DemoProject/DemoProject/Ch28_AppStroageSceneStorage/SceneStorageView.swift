//
//  AppStroageSceneStorageView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("city") var city: String = ""
    
    var body: some View {
        
        Text("SceneStorageView")
        TextEditor(text: $city)
            .padding()

    }
}

#Preview {
    SceneStorageView()
}
