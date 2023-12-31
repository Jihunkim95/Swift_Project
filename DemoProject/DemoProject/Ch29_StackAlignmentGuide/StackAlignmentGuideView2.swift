//
//  StackAlignmentGuideView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
/*
 SwiftUI 스택 정렬 예제 02
 다음 코드는 ZStack을 사용하여 두 개의 Rectangle 뷰를 겹치게 하려고 합니다.
 alignment 매개변수를 사용하여 첫 번째 Rectangle 뷰가 왼쪽 상단에, 두 번째 Rectangle 뷰가 오른쪽 하단에 위치하도록 코드를 수정해보세요.
 */
//p.294
extension HorizontalAlignment{
    private enum MyHorizontal: AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let exAlignment = HorizontalAlignment(MyHorizontal.self)
}
//p.294
extension VerticalAlignment{
    private enum MyVertical: AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let exAlignment = VerticalAlignment(MyVertical.self)
}

// p295
extension Alignment{
    static let exAlignment = Alignment(horizontal: HorizontalAlignment.exAlignment, vertical: VerticalAlignment.exAlignment)
}
struct StackAlignmentGuideView2: View {
    var body: some View {
        ZStack(alignment: .exAlignment){
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .alignmentGuide(HorizontalAlignment.exAlignment) { d in
                    d[.trailing]
                }
                .alignmentGuide(VerticalAlignment.exAlignment) { d in
                    d[.bottom]
                }

            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .alignmentGuide(HorizontalAlignment.exAlignment) { d in
                    d[.leading]
                }
                .alignmentGuide(VerticalAlignment.exAlignment) { d in
                    d[.top]
                }

        }
    }
}

#Preview {
    StackAlignmentGuideView2()
}
