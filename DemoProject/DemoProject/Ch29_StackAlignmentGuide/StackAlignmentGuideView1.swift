//
//  StackAlignmentGuideView1.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
/*
 SwiftUI 스택 정렬 예제 01
 다음 코드는 VStack과 HStack을 사용하여 두 개의 Text 뷰를 수평으로 정렬하려고 합니다.

 alignment 매개변수를 사용하여 두 Text 뷰가 글자 아랫부분을 기준으로 수평 정렬되도록 코드를 수정해보세요.
 */
struct StackAlignmentGuideView1: View {
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline, spacing: 20) {
                Text("Hello\n")
                    .font(.largeTitle)
                Text("World")
            }
        }
    }
}

#Preview {
    StackAlignmentGuideView1()
}
