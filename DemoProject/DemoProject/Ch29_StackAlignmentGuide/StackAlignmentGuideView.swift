//
//  StackAlignmentGuideView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI


struct StackAlignmentGuideView: View {
    var body: some View {
        VStack(spacing: 50) {
            // 컨테이너 정렬 VStack
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some longer text")
                Text("This is short")
            }
            // 컨테이너 정렬 HStack
            HStack(alignment: .lastTextBaseline, spacing: 20) {
                Text("This is some text")
                    .font(.largeTitle)
                Text("This is some longer text")
                    .font(.body)
                Text("This is short")
                    .font(.headline)
            }
            // 정렬 가이드
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        120.0
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        120.0
                    })

            }
        }
    }
}

#Preview {
    StackAlignmentGuideView()
}
