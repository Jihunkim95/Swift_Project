//
//  ContentView.swift
//  DemoProject

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                Text("목록")
                List{
                    NavigationLink(destination: BasicSwiftUIListView()){
                        Text("Ch19 기본SwiftUI 프로젝트분석")
                    }.padding()
                    
                    NavigationLink(destination: CreateCustomListView()){
                        Text("Ch20 커스텀뷰 생성하기")
                    }.padding()
                    
                    NavigationLink(destination: StackFrameListView()){
                        Text("Ch21 스택과 프레임")
                    }.padding()
                    
                    NavigationLink(destination: PublisherSubscriberListView()){
                        Text("Ch22 상태 프로퍼티, Observable, Sate, Evironment객체")
                    }.padding()
                    
                    NavigationLink(destination: ConcurrencyListView()){
                        Text("Ch24 구조화된 동시성")
                    }.padding()
                    
                    NavigationLink(destination: ObservableEnvironmentListView()){
                        Text("Ch27 Observable객체와 Enviorment 객체 튜토리얼")
                    }.padding()
                    NavigationLink(destination: AppStroageSceneStorageListView()){
                        Text("Ch28 AppStorage와 SceneStorage를 사용한 SwiftUI 데이터의 지속성")
                    }.padding()
                    
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
//
//  Created by 김지훈 on 2023/10/10.
//
