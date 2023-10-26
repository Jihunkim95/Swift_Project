//
//  AppStroageSceneStorageContentView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct AppStroageSceneStorageContentView: View {
    var body: some View {
        TabView{
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            
            AppStoregeView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    AppStroageSceneStorageContentView()
}
