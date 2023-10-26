//
//  ActerView4.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI

struct ActerView4: View {
    @State private var multiplier = Multiplier(factor: 2)
    @State private var result:Int = 0
    
    var body: some View {
        VStack{
            Text("actor를 사용한 두 숫자 곱").font(.largeTitle)
            Button("Enter", action: {
                Task {
                     result = await multiplier.multiply(4)
                }
            })
            Text("결과 : \(String(result))")
        }
    }
    
    actor Multiplier{
        var factor:Int = 0
        
        init(factor:Int) {
            self.factor = factor
        }
        
        func multiply(_ expression:Int) -> Int {
            return factor * expression
        }
    }
}

#Preview {
    ActerView4()
}
