//
//  ios_01-SwiftEx05_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/10.
//

import SwiftUI

struct BasicSwiftUIView2: View {
    @State private var inputSwift:Int = 0
    @State private var inputIOS:Int = 0
    @State private var inputWeb:Int = 0
    @State private var resultSum:Int = 0
    @State private var resultAvg:Int = 0
    var body: some View {
        VStack{
            Text("Swift, IOS, Web 점수를 입력 받아 합계와 평균을 표시하는 앱")
            HStack{
                Text("Swift : ")
                TextField("Swift점수 입력", value: $inputSwift, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack{
                Text("IOS : ")
                TextField("IOS점수 입력", value: $inputIOS, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack{
                Text("Web : ")
                TextField("Web점수 입력", value: $inputWeb, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button("출력", action:{Sum(); Avg();})
            
            Text("합계 \(resultSum)")
            Text("평균 \(resultAvg)")
        }
    }
    func Sum(){
        resultSum = inputSwift + inputIOS + inputWeb
    }
    func Avg(){
        resultAvg = (inputSwift + inputIOS + inputWeb)/3
    }
}

#Preview {
    BasicSwiftUIView2().padding(50)
}
