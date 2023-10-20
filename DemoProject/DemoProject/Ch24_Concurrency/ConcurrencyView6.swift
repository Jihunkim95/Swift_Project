//
//  ConcurrencyView6.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView6: View {
    @State private var a:Int = 0
    @State private var b:Int = 0
    var body: some View {
        /*
         동시성 예제 04
         다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.
         하지만 이 코드는 컴파일 에러가 발생합니다.
         에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.
         */
        VStack{
            Text("두개 비동기 함수 호출 결과").font(.largeTitle)
            
            HStack{
                TextField("num1", value: $a, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                Text("~")
                TextField("num2", value: $b, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }

            Button(action: {Task{await asyncPrintSum(a,b)}}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                
            })
            Text("결과는 하단Previews를 확인")
            
        }
        
        
        
        
    }
    func asyncAdd(_ x: Int, _ y: Int) async -> Int {
        
        return x + y
    }

    func asyncPrintSum(_ a: Int, _ b: Int) async {
        let sum = await asyncAdd(a, b)
        print(sum)
    }
}

#Preview {
    ConcurrencyView6()
}
