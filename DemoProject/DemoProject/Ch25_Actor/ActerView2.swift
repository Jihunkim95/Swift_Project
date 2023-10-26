//
//  ActerView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/23.
//

import SwiftUI

struct ActerView2: View {
    
    @State private var builder = BuildMessage()
    @State private var asyncResult = ""
    @State private var syncResult = ""
    var body: some View {
        
        VStack{
            Text("Acter내에 데이터 격리 nonisolated")
            Button("비동기 Enter", action: {Task{await asyncFunction()}}
            ).frame(width: 50,height: 40).border(Color.white, width: 2)
            
            Button("동기 Enter", action: {Task{syncFunction()}}
            ).frame(width: 50,height: 40).border(Color.white, width: 2)
            
            Text("비동기 결과 : \(asyncResult)")
            Text("동기 결과 : \(syncResult)")
        }
        
    }
    actor BuildMessage{
        var message: String = ""
        let greeting: String = "Hello"
        
        func setName(name: String){
            self.message = "\(greeting)\(name)"
        }
        
        //nonisolated로 비동기 안에서 데이터격리 동기코드 작성
        nonisolated func getGreeting() -> String{
            return greeting
        }
    }
    /*actor BuildMessage에서 데이터 격리 함수까지 작성하였으므로, await기워드 없이 작성 가능*/
    func asyncFunction() async ->String {
        let greeting = builder.greeting
        asyncResult = greeting
        return asyncResult
    }
    func syncFunction()-> String {
        let greeting = builder.greeting
        syncResult = greeting
        return syncResult
    }
}

#Preview {
    ActerView2()
}
