//
//  ConcurrencyView8.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView8: View {
//    @State private var a:Int = 0
//    @State private var b:Int = 0
    
    var body: some View {
        /*
         동시성 예제 07
         다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.
         하지만, 이 코드는 오류가 발생합니다.
         왜 그런지 설명하고, 오류를 수정한 코드를 작성하세요.
         */
        
        VStack{
            Text("비동기 함수 형변환 호출").font(.largeTitle)
            
            Button(action: {Task{await asyncPrintSum()}}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Text("결과는 하단Previews를 확인")
        }
    }
    func asyncAdd(_ x: Int, _ y: Int) async -> Int {
        return x + y
    }

    func asyncPrintSum() async {
        let a = await asyncAdd(10, 20)
        let b = await asyncAdd(30, 40)
        print(a + b)
    }

}

#Preview {
    ConcurrencyView8()
}
