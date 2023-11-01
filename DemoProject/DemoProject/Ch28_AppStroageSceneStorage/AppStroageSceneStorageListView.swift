//
//  AppStroageSceneStorageListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct AppStroageSceneStorageListView: View {
//    @EnvironmentObject var colorsetting:ColorSetting
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink(destination: AppStroageSceneStorageContentView()){
                        Text("ContentView")
                    }.padding()
                    
//                    NavigationLink(destination: AppStroageSceneStorageView1().environmentObject(ColorSetting())){
//                        Text("예제1, 1화면 컬러피커 2화면 해당 배경색으로변경")
//                    }.padding()
                    
                    NavigationLink(destination: AppStroageSceneStorageView2()){
                        Text("예제2, TabView활용 앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원")
                    }.padding()
                    
                    NavigationLink(destination: AppStroageSceneStorageView3()){
                        Text("예제3, 앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원")
                    }.padding()
                    
                    NavigationLink(destination: AppStroageSceneStorageView4()){
                        Text("예제4, 네비게이션 뷰의 현재 선택된 항목을 저장 후 껐다 킬때 복원")
                    }.padding()
                    
                }
            }
        }
    }
}

#Preview {
    AppStroageSceneStorageListView()
}
