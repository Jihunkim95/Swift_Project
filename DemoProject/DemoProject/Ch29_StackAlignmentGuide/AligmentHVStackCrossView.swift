//
//  AligmentHVStackCrossView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
//p.292 스택 정렬 교차하기
extension VerticalAlignment{
    private enum CrossAligment: AlignmentID{
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAligment.self)
}

struct AligmentHVStackCrossView: View {
    var body: some View {
        //HStack안에 VStack이 포함된 스택의 구성도
        //Circle이 alignmentGuide~이 사용된 Rectangle기준으로 정렬기준이 변함
        HStack(alignment: .crossAlignment, spacing: 20){
            Circle()
                .foregroundColor(.purple)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .alignmentGuide(.crossAlignment, computeValue: { d in
                    d[VerticalAlignment.center]
                })
            
            VStack{
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                //alignmentGuide 잘라내서 다른 Rectangle()에 붙여넣으면서 비교가능
                    .alignmentGuide(.crossAlignment, computeValue: { d in
                        d[VerticalAlignment.center]
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            }
        }
    }
}
#Preview {
    AligmentHVStackCrossView()
}
