//
//  ListNavigationQuizView4.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 SwiftUI List 예제 04
 List 를 사용하여 다음과 같은 화면을 구현해보세요.

 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 스위치가 있습니다.
 스위치는 기본적으로 꺼져 있으며, 스위치를 드래그하면 켜지거나 꺼지게 됩니다.
 스위치가 켜진 행의 텍스트는 굵게 표시되고, 스위치가 꺼진 행의 텍스트는 일반적으로 표시됩니다.
 */

struct ListNavigationQuizView4: View {
    @State private var switchsArray: [Bool] = Array(repeating: false, count: 10)
    
    var body: some View {
        Text("SwiftUI List Quiz")
                    .font(.largeTitle)
                    .padding()
                List(0...9, id: \.self) { item in
                    HStack {
                        Text("Item \(item + 1)")
                            .fontWeight(switchsArray[item] ? .bold : .regular)
                        Spacer()
                        Toggle("", isOn: $switchsArray[item])
                    }
                }
    }
    
}

#Preview {
    ListNavigationQuizView4()
}
