//
//  StackAlignmentGuideListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI

struct StackAlignmentGuideListView: View {
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink(destination: StackAlignmentGuideView()){
                        Text("스택 정렬과 가이드")
                    }.padding()
                    NavigationLink(destination: AligmentHVStackCrossView()){
                        Text("스택 정렬 교차하기")
                    }.padding()
                    NavigationLink(destination: AligmentZStackView()){
                        Text("ZStack 커스텀 정렬")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView1()){
                        Text("예제1,Text아랫글자 기준 수평정렬")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView2()){
                        Text("예제2,ZStack을 이용한 정렬")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView3()){
                        Text("예제3,좌측 상단,중단,우측 하단")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView4()){
                        Text("예제4,세로일때 위, 가로일때 중간")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView5()){
                        Text("예제5,hasSuffix를 활용한 up,down이미지 교체")
                    }.padding()
                    NavigationLink(destination: StackAlignmentGuideView6()){
                        Text("예제6,수직,수평정렬")
                    }.padding()

                }
            }
        }
    }
}

#Preview {
    StackAlignmentGuideListView()
}
