//
//  DivideOrangeView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/10.
//

import SwiftUI

struct DivideOrangeView: View {

    @State private var inputA:Int = 0
    @State private var inputB:Int = 0
    @State private var resultA:Int = 0
    @State private var resultB:Int = 0
    
    var body: some View {
        
        VStack{
            Text("제주 감귤 나누기")
            HStack{
                Text("귤?")
                TextField("A숫자", value: $inputA, format: .number)        .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.teal)
            }
            
            HStack{
                Text("한 박스 갯수?")
                TextField("B숫자", value: $inputB, format: .number)
                    .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(Color.teal)
            }
            
            Button("계산", action: {Divide(); Remain();}).padding(20)
            
            HStack{
                Text("귤 박스 갯수\(resultA)")
            }
            
            HStack{
                Text("박스에 담고 남은 귤 수 \(resultB)")
            }
            
        }


    }
        func Divide(){resultA = inputA / inputB}
        func Remain(){resultB = inputA % inputB}
    
}

#Preview {
    DivideOrangeView().padding(10)
}



