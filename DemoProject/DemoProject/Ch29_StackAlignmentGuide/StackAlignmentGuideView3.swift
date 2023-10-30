//
//  StackAlignmentGuideView3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

/*
 SwiftUI 스택 정렬 예제 03
 다음 코드는 VStack과 HStack을 사용하여 세 개의 Circle 뷰를 수평으로 정렬하려고 합니다.
 
 alignment 매개변수와 Spacer 뷰를 사용하여 첫 번째 Circle 뷰가 왼쪽에, 두 번째 Circle 뷰가 가운데에, 세 번째 Circle 뷰가 오른쪽에 위치하도록 코드를 수정해보세요.
 */
import SwiftUI

struct StackAlignmentGuideView3: View {
    var body: some View {
        VStack {
            HStack(alignment: .top){
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(.top, computeValue: { dimension in
                        dimension[.bottom]
                    })
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
                    .alignmentGuide(.top, computeValue: {
                        dimension in print("dimension: \(dimension[.bottom])")
                        return  -dimension[.bottom]
                    })
            }
        }
    }
}

#Preview {
    StackAlignmentGuideView3()
}
//VStack{
//    Circle()
//        .fill(Color.green)
//        .frame(width: 50, height: 50)
//    Spacer()
//}
//
//VStack{
//    Circle()
//        .fill(Color.yellow)
//        .frame(width: 50, height: 50)
//}.padding()
//
//VStack{
//    Spacer()
//    Circle()
//        .fill(Color.orange)
//        .frame(width: 50, height: 50)
//}.padding()
