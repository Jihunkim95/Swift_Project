//
//  AppStroageSceneStorageView4.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/29.
//

import SwiftUI

/*
 데이터 지속성 예제 04
 SceneStorage 또는 AppStorate 를 사용하여 네비게이션 뷰의 현재 선택된 항목을 저장하고,
 앱이 백그라운드로 또는 종료 했다가 다시 실행/활성화될 때 복원하는 코드를 작성하세요.
 */
struct AppStroageSceneStorageView4: View {
    var body: some View {
        NavigationView{
            
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: AppStroageSceneStorageView3()){
                    Text("ContentView")
                }.padding()
            }

        }
        
    }
}

#Preview {
    AppStroageSceneStorageView4()
}
