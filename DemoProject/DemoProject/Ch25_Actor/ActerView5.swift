//
//  ActerView5.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI

/*
 액터 예제 03
 다음 코드에서 actor 를 사용하여 Counter 클래스를 정의하고, increment 메서드를 구현하세요.
 (increment 메서드는 내부의 count 프로퍼티를 1 증가시킨다.)
 */
struct ActerView5: View {
    
    @State private var result:Int = 0
    @State private var counter = Counter()
    var body: some View {
        Text("actor를 사용한 1 증가").font(.largeTitle)
        Button("Enter", action: {
            Task{result = await counter.increment()}
        })
        Text("결과 : \(String(result))")
    }
    actor Counter{
        var count:Int = 0

        func increment() ->Int{
            count += 1
            return count
        }
    }
}

#Preview {
    ActerView5()
}
