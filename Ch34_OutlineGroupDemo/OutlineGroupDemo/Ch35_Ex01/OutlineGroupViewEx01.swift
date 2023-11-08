//
//  OutlineGroupViewEx01.swift
//  OutlineGroupDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI
/*
 #### OutlineGroup 예제 01

 OutlineGroup을 이용하여 계층적인 데이터를 표시하려고 합니다.
 다음 화면이 되도록 구현해 보세요.
 */

//샘플 데이터 구조 p.355
struct AbcInfo: Identifiable {
    var id = UUID()         // instence identify
    var name: String        // 알파벳 이름
    var children: [AbcInfo]? // 계층형 구조를 위한것 carItems에서 3단계로 쓰임
}

let abcItems: [AbcInfo] = [
    AbcInfo(name: "",children: [
     AbcInfo(name: "A",children: [
        AbcInfo(name: "B"),
        AbcInfo(name: "C",children: [
            AbcInfo(name: "D"),
            AbcInfo(name: "E")])])
    ,AbcInfo(name: "F")
    ]
     )
    
]


struct OutlineGroupViewEx01: View {
    var body: some View {
        List {
            ForEach(abcItems) { abcItem in
                    // 데이터를 화면에 표현하는 것에 더 큰 제어 기능을 제공
                    // Section으로 구분하여 표시
                    // List 뷰에 포함하면 시각적으로 만족스러움
                    OutlineGroup (abcItem.children ?? [AbcInfo](),children: \.children){
                        child in
                        
                        CellViewEx01(item: child)
                    } // end OutlineGroup
                }
        }
        .listStyle(.grouped)
    }
}

// 각 list Cell에 표시할 CustomView를 Design
struct CellViewEx01: View {
    var item: AbcInfo
    var body: some View{
        HStack{
            Text(item.name)
                .font(.system(.title3,design: .rounded))
        }
    }
}

#Preview {
    OutlineGroupViewEx01()
}
