//
//  TabViewDemo.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/09.
//


import SwiftUI
struct TabViewDemoView: View {
    
    @State private var selection = 1
    var body: some View {
        VStack{
            Text("\(selection)")
            // TabView 콘텐트 추가
            TabView(selection: $selection){
                Text("First Content view")
                    .tabItem{
                        Image(systemName: "1.circle")
                        Text("Screen One")
                    }
                    //TabView(selection: $selection)과 한짝
                    .tag(1)
                Text("Second Content view")
                    .tabItem{
                        Image(systemName: "2.circle")
                        Text("Screen Two")
                    }
                    .tag(2)

                Text("Third Content view")
                    .tabItem{
                        Image(systemName: "3.circle")
                        Text("Screen Three")
                    }
                    .tag(3)

                
            }.font(.largeTitle)
            // 뷰 페이징
            // 탭 아이템 추가시 시각적 표시 제공을 위해 tabViewStyle() 수정자 제거
    //         // tabViewStyle, tabItem 사용하려면 tabViewStyle 꺼야함
             .tabViewStyle(PageTabViewStyle())
        }
        .background(.green)
//        Color(red: 152, green: 170, blue: 124)

    }
}

#Preview {
    TabViewDemoView()
}
