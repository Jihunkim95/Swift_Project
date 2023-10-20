//
//  BasicSwiftUIListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct BasicSwiftUIListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ch19 기본SwiftUI 프로젝트분석")
                List{
                    NavigationLink(destination: CalcView()){
                        Text("계산기")
                    }.padding()
                    
                    NavigationLink(destination: DivideOrangeView()){
                        Text("오렌지 나누기")
                    }.padding()
                    
                    NavigationLink(destination: FormatView()){
                        Text("100자리 숫자 버리기")
                    }.padding()
                    
                    NavigationLink(destination: BasicSwiftUIView()){
                        Text("일의 자리를 1로 바꾸는 앱")
                    }.padding()
                    
                    NavigationLink(destination: BasicSwiftUIView2()){
                        Text("점수의 평균 산출")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    BasicSwiftUIListView()
}
