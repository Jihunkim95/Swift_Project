//
//  AppStroageSceneStorageView3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/29.
//

import SwiftUI

/*
데이터 지속성 예제 03
SceneStorage 또는 AppStorate 를 사용하여 사용자의 이름을 저장하고,
텍스트 필드에 입력하면 자동으로 업데이트되고,
앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원하는 코드를 작성하세요.
 */
struct AppStroageSceneStorageView3: View {
    @AppStorage("name") var name:String = ""
    var body: some View {

        Text("君の名前は?")
            .font(.title)
            .foregroundColor(.black)
            .padding(.top, 20)
        Image("너의 이름은").resizable()
            .frame(width: 380, height: 200)
            .cornerRadius(10)
        
        TextField("이름을 입력하세요", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 20)
            .padding(.top, 10)
    
    }
}

#Preview {
    AppStroageSceneStorageView3()
}
