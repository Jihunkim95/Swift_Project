//
//  ConcurrencyView7.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView7: View {
    @State private var input:Int = 0
    var body: some View {
        /*
        동시성 예제 05
        다음 코드는 비동기 함수 fetchUser(id:)를 호출하고, 그 결과를 print하는 코드입니다.
        이 코드에 에러가 있는지, 있다면 어디에 있는지 찾아보고, 없다면 출력 결과를 예상해보세요.
         */
        Text("비동기 함수 형변환 호출").font(.largeTitle)
        VStack{
            TextField("num 1", value: $input, format: .number)
            .textFieldStyle(.roundedBorder)
            .keyboardType (.decimalPad)
            .foregroundColor (.black)
            .multilineTextAlignment (.center)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            Button("클릭", action: {Task{await printUser(id: input)}})
            
            Text("결과는 하단Previews를 확인")
        }

    }
    func fetchUser(id: Int) async -> String {
        // some network request
        return "User \(id)"
    }

    func printUser(id: Int) async {
        let user = await fetchUser(id: id)
        print(user)
    }
}

#Preview {
    ConcurrencyView7()
}
