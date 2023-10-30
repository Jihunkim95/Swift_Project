//
//  AligmentZStackView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI


//p.294
extension HorizontalAlignment{
    private enum MyHorizontal: AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}
//p.294
extension VerticalAlignment{
    private enum MyVertical: AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

// p295
extension Alignment{
    static let myAlignmet = Alignment(horizontal: HorizontalAlignment.myAlignment, vertical: VerticalAlignment.myAlignment)
}
// 스택 정렬 교차(스택 겹치기) p.291
struct AligmentZStackView: View {
    var body: some View {
        //p.295
        ZStack(alignment: Alignment.myAlignmet){
            Rectangle()
                .foregroundColor(.green)
                .alignmentGuide(HorizontalAlignment.myAlignment){
                    d in
                    d[.trailing]
                }
                .alignmentGuide(VerticalAlignment.myAlignment){
                    d in
                    d[.bottom]
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(HorizontalAlignment.myAlignment){
                    d in
                    d[HorizontalAlignment.center]
                }
                .alignmentGuide(VerticalAlignment.myAlignment){
                    d in
                    d[VerticalAlignment.top]
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            
            Circle()
                .foregroundColor(.orange)
                .alignmentGuide(HorizontalAlignment.myAlignment){
                    d in
                    d[HorizontalAlignment.leading]
                }
                .alignmentGuide(VerticalAlignment.myAlignment){
                    d in
                    d[VerticalAlignment.bottom]
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        }
    
    }
}

#Preview {
    AligmentZStackView()
}
