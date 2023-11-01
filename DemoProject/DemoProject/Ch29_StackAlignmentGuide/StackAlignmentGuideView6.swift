//
//  StackAlignmentGuideView6.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
/*
 SwiftUI 스택 정렬 예제 05
 다음 코드는 세 개의 텍스트 뷰를 수직으로 정렬하고, 첫 번째 텍스트 뷰는 위에, 두 번째 텍스트 뷰는 중앙에, 세 번째 텍스트 뷰는 아래에 배치하려고 한다.

 원하는 결과를 얻도록 코드를 수정해보세요.
 */
struct StackAlignmentGuideView6: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.yellow)
                Spacer()
                Image(systemName: "moon.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
            }
        }
        
        VStack(alignment: .trailing) {
            Image(systemName: "arrow.up.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            Spacer()
            Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
            Spacer()
            Image(systemName: "arrow.down.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    StackAlignmentGuideView6()
}
