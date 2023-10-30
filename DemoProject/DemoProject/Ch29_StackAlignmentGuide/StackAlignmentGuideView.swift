//
//  StackAlignmentGuideView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
//p.289 수직 정렬 타입 생성
extension VerticalAlignment{
    private enum OneThird : AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let oneThrid = VerticalAlignment(OneThird.self)
}

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
            //283. 커스텀 정렬타입
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
            //288. 커스텀 정렬타입
            HStack(alignment: .oneThrid) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 200)
                //p.289 수직 정렬 타입 적용
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThrid, computeValue: { d in
                        d[VerticalAlignment.top]
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 200)
                    .alignmentGuide(.oneThrid, computeValue: { d in
                        d[VerticalAlignment.top]
                    })
            }
        }
        
    }

}

#Preview {
    StackAlignmentGuideView()
}
