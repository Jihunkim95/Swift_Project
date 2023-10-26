//
//  ActerView6.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI
/*
 액터 예제 04
 actor 를 사용하여 비동기적으로 두 개의 문자열을 연결하는 함수를 정의하고 호출하는 액터를 작성하세요.
 */
struct ActerView6: View {
    
    @State private var inputA:String = ""
    @State private var inputB:String = ""
    @State private var result:String = ""
    @State private var concatenater = Concatenater()
    
    var body: some View {
        VStack{
            Text("actor이용 비동기적으로 두 개의 문자열을 연결하는 함수").font(.largeTitle)
            HStack{
                TextField("A", text: $inputA).textFieldStyle(.roundedBorder)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                TextField("B", text: $inputB).textFieldStyle(.roundedBorder)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }
            Button("Enter", action: {
                Task{result = await concatenater.concatenate(inputA,inputB)}
            })
            Text("결과 : \(result)")

        }
        
    }
    actor Concatenater{
        func concatenate(_ expressionA:String,_ expressionB:String) -> String {
            return expressionA + expressionB
        }
    }
}

#Preview {
    ActerView6()
}
