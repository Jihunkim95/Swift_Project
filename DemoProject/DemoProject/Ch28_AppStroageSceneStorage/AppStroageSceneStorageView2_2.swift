//
//  AppStroageSceneStorageView2_2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/29.
//

import SwiftUI

struct AppStroageSceneStorageView2_2: View {
    @SceneStorage("dummy") var dummy:String = ""
    var body: some View {
        TextField("내용입력", text: $dummy)
    }
}

#Preview {
    AppStroageSceneStorageView2_2()
}
