//
//  StackFrameView.swift
//  DemoProject2
//
//  Created by 김지훈 on 2023/10/12.
//

import SwiftUI

struct StackFrameView: View {
    // 동적 HStack/VStack 변환
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,spacing: 15){
            
//            myLayout {
//                Image(systemName: "goforward.10")
//                Image(systemName: "goforward.15")
//                Image(systemName: "goforward.30")
//            }
//            HStack{
//                Button("HStack")
//            }
            Spacer()// 뷰 사이에 공간을 추가(스택 방향에 따라 유연하게 확장/축소)
            VStack{
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            Spacer()
        }
        Text("Hello, world")
            .padding(.horizontal,20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        HStack{
            Text("Q====")
            VStack{
                Text("Q1")
                Text("Q2")
                Text("Q3")
            }
        }.border(Color.black)
        
        // 텍스트 줄 제한과 레이아웃 우선순위
        HStack{
            Image(systemName: "airplane")
            Text("Flight times:")
                .layoutPriority(1) //보이는것 우선순위 맥이기
            Text("London")
            Text("Seoul")
                .layoutPriority(2)
        }.font(.largeTitle)
            .lineLimit(1...2)
        
        // SwiftUI 프레임: 뷰 크기를 조절
        // .infinity 사용 가능한 모든 영영을 차지
        // .edgesIgnoringSafeArea() 안전 영역을 무시
        Text("SwiftUI Frame")
            .font(.largeTitle)
            .border(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        
        // 뷰들을 담고 있는 컨테이너의 크기에 때라 조절
        GeometryReader{ geometry in
            VStack{
                //VStack의 1/2 폭과 3/4 높이를 차지
                Text("GeometryReader")
                    .font(.largeTitle)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width/2, height: (geometry.size.height / 4 * 3))
                
                //VStack의 1/3 폭과 1/4 높이를 차지
                Text("GeometryReader")
                    .font(.largeTitle)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: geometry.size.width/3, height: (geometry.size.height / 4 * 1))
                
            }
        }
    }
    
}

#Preview {
    StackFrameView()
}
