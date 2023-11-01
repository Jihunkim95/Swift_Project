//
//  NavigationQuizView1.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 Navigation 예제 01
 SwiftUI에서 NavigationStack을 사용하여
 
 첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 타이틀을 "Second View"로 설정하고,
 
 두 번째 화면에서 첫 번째 화면으로 돌아갈 때, 첫 번째 화면의 타이틀을 "First View"로 변경하는 코드를 작성하세요.
 */

class TitleData : ObservableObject{
    @Published var titleName = "Second View가즈아"
}
struct NavigationQuizView1: View {
    
    @StateObject var titleData: TitleData = TitleData()
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: SecondView(titleData: titleData)) {
                Text( titleData.titleName )
                    .navigationBarTitle(titleData.titleName)
                
            }
        }
    }
}


struct SecondView: View {

    @StateObject var titleData: TitleData
    
    var body: some View {

        Text("Second View")
            .navigationBarTitle("Second View")
            .onAppear {
                titleData.titleName = "안녕? 나 First View"
            }
    }
}

#Preview {
    NavigationQuizView1(titleData: TitleData())
}
