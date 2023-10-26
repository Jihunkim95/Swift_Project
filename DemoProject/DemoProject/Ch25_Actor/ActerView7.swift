//
//  ActerView7.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI
/*
 액터 예제 05
 다음 기능들을 갖는 StringEx 액터를 정의하세요.

 비동기적으로 문자열을 대문자로 변환하는 함수를 정의
 비동기적으로 문자열을 소문자로 변환하는 함수를 정의
 비동기적으로 문자열을 역순으로 변환하는 함수를 정의
 */

actor StringEx{
    var str:String = ""
    init(str: String) {
        self.str = str
    }
    func capitalize() -> String {
        String(str.uppercased())
    }
    func lowercase() -> String {
        String(str.lowercased())
    }
    func reverse() -> String {
        String(str.reversed())
    }
}

struct ActerView7: View {
    @State private var result:String = ""
    @State private var stringEx = StringEx(str: "Swift")
    var body: some View {
        VStack{
            Text("actor이용 대문자,소문자,역순").font(.largeTitle)
            
            Button("대문자 버튼", action: {
                Task{result = await stringEx.capitalize()}
            }).font(.title3)
            Button("소문자 버튼", action: {
                Task{result = await stringEx.lowercase()}
            }).font(.title3)
            Button("역순 버튼", action: {
                Task{result = await stringEx.reverse()}
            }).font(.title3)
            Text("결과 : \(result)")
        }
    }

}

#Preview {
    ActerView7()
}
