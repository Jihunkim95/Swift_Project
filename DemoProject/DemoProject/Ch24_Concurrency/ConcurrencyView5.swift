//
//  ConcurrencyListView5.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView5: View {
    
    @State private var random:Int = 0
    var body: some View {
        
        VStack{
            Text("비동기 함수를 호출하고 결과를 출력하는 코드")
            Button(action: {
                Task{ await asyncFunction() }
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Text("결과 : \(String(random))")
        }

    }
    func asyncFunction() async -> Int {
        random = Int.random(in: 1...10)
        return random
    }
}

#Preview {
    ConcurrencyView5()
}
