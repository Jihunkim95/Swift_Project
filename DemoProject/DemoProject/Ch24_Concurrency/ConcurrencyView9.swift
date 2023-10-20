//
//  ConcurrencyView9.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView9: View {
    /*
     동시성 예제 01
     1부터 100까지의 합을 구하는 비동기 함수
     async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 합하여 출력하는 함수를 작성해보세요.
     */
    @State private var text:String = "Hi"
    @State private var x:Int = 0
    @State private var y:Int = 0
    @State private var result:Int = 0
    var body: some View {

        VStack{
            Text("1~100까지 합 비동기")
            
            HStack(spacing: 30 ){
                TextField("num1", value: $x, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                Text("~")
                TextField("num2", value: $y, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                
            }
            Button("Enter", action: {Task{await doSomething(x,y)}}).frame(width: 50,height: 40).border(Color.white, width: 2)
            
            Text("\(result)")
        }
        
        
    }
    

    func doSomething(_ x:Int,_ y:Int) async -> Int{
        // async let을 사용하여 두 개의 비동기 작업을 동시에 실행
        async let result1 = sumFrom(x, y/2)
        async let result2 = sumFrom(x/2+1, y)
        // 결과를 출력
        let a = await result1
        let b = await result2
        result = a + b
        return result
    }
    func sumFrom(_ start:Int,_ end:Int)->Int{
        var ex:Int = 0
        for i in start...end{
            ex += i
        }
        return ex
    }
}

#Preview {
    ConcurrencyView9()
}
