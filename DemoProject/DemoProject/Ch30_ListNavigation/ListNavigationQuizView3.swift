//
//  ListNavigationQuizView3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 SwiftUI List 예제 03
 List 를 사용하여 다음과 같은 화면을 구현해보세요.

 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 체크마크 아이콘이 있습니다.
 체크마크 아이콘은 기본적으로 숨겨져 있으며, 행을 선택하면 보이게 됩니다.
 다른 행을 탭하면 이전에 선택된 행의 체크마크 아이콘이 사라지고, 새로 선택된 행의 체크마크 아이콘이 보이게 됩니다.
 */

struct ListNavigationQuizView3: View {

    @State private var itemStates: [Bool] = Array(repeating: false, count: 10)

    @State private var imageFlag = true
    var body: some View {
        List{
            ForEach(0..<itemStates.count, id: \.self) { index in
                HStack {
                    Text("item \(index + 1)")
                    Spacer()
                    Image(systemName: itemStates[index] == true ? "checkmark" : "" )
                }
                .onTapGesture {
                    itemStates[index].toggle()
//                    print(itemStates)
                    for i in itemStates.indices { // 현재 버튼을 제외한 버튼에 체크마크 해제
                        if i != index {
                            itemStates[i] = false
                        }
                    }
//                    print(itemStates.enumerated().filter{$0.element}.map{$0.offset})
//                    print(itemStates.indices.filter{itemStates[$0]})
                }
            }
        }
        
    }
}

#Preview {
    ListNavigationQuizView3()
}
