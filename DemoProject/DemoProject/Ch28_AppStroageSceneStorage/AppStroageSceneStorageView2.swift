//
//  AppStroageSceneStorageView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/29.
//
/*
데이터 지속성 예제 02
SceneStorage 또는 AppStorate 를 사용하여 탭바 뷰의 선택된 인덱스를 저장하고,
앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원하는 코드를 작성하세요.
 */
import SwiftUI

struct AppStroageSceneStorageView2: View {
    var body: some View {

        TabView{
            AppStroageSceneStorageView2_2().tabItem {
                Image(systemName: "1.square.fill")
                Text("First")
              }
        }
        
    }
}

#Preview {
    AppStroageSceneStorageView2()
}
