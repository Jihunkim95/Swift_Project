//
//  ios_01-SwiftEx04_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/10.
//

import SwiftUI

struct BasicSwiftUIView: View {
    @State private var input:Int = 0
    @State private var result:Int = 0
    
    //프로퍼티로서의 뷰
    let carStack = HStack{
        Text("Car Image")
            .font(.headline)
            .foregroundColor(.red)
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        
        VStack{
            carStack
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("수 하나를 입력받아서 일의 자리를 1로 바꾸는 앱")
            TextField("A숫자", value: $input, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("계산",action: Change).font(.system(size: 24)) .frame(width: 200, height: 50).border(Color.red, width: 2)
            Text("결과 ? \(result)")
        }.padding(100).background(Color.indigo)
//        //하위뷰로 작성
//        MyStackView().font(.largeTitle)
    }
    func Change(){
        if input/10 == 0 {
            result = input
        }else{
            result = input/10*10+1
        }

    }
}

//struct MyStackView(){
//    var body: some View{
//        HStack{
//            Text("name")
//            Text("age")
//        }
//    }
//}
#Preview {
    BasicSwiftUIView()
}
