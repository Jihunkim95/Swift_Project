//
//  CalcView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/10.
//

import SwiftUI

struct CalcView: View {
    
    @State private var inputA:Int = 0
    @State private var inputB:Int = 0
    @State private var result:Int = 0
    
    var body: some View {
        Text("계산기")
        
        HStack{
            //NumberField는 없냐?
            TextField("A숫자", value: $inputA, format: .number)        .textFieldStyle(.roundedBorder)
                .padding()
                .background(Color.teal)
            TextField("B숫자", value: $inputB, format: .number)
                .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.teal)
                    .keyboardType(.numberPad)
            Text("=")
            TextField("결과", value: $result, format: .number)
                .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.teal).disabled(true)
            
        }
        HStack{
            Button("+", action: Plus).padding(20)
            Button("-", action: Minus).padding(20)
            Button("X", action: Multiply).padding(20)
            Button("/", action: Divide).padding(20)
        }

    }
    func Plus(){result = inputA + inputB}
    func Minus(){result = inputA - inputB}
    func Multiply(){result = inputA * inputB}
    func Divide(){result = inputA / inputB}
    
}
//
//struct CalcView: View {
//    @State private var num1: String = ""
//    @State private var num2: String = ""
//    @State private var add: String = ""
//    @State private var sub: String = ""
//    @State private var mul: String = ""
//    @State private var div: String = ""
//    @State private var flag1: Bool = true
//    @State private var flag2: Bool = true
//    
//    var body: some View {
//        VStack {
//            VStack {
//                TextField("first", text: $num1)
//                    .keyboardType(.numberPad)
//                    .onChange(of: self.num1, perform: {
//                        self.num1 = $0
//                        self.flag1 = self.num1 == "" ? true : false
//                    })
//                TextField("Second", text: $num2)
//                    .keyboardType(.numberPad)
//                    .onChange(of: self.num2, perform: {
//                        self.num2 = $0
//                        self.flag2 = self.num2 == "" ? true : false
//                    })
//            }
//            .padding(10)
//            Button(action: {
//                guard let num1: Int = Int(num1) else { return }
//                guard let num2: Int = Int(num2) else { return }
//                self.add = String(num1 + num2)
//                self.sub = String(num1 - num2)
//                self.mul = String(num1 * num2)
//                self.div = String(Double(num1) / Double(num2))
//            }, label: {
//                Text("계산")
//                    .fontWeight(.bold)
//            })
//            .buttonStyle(.borderedProminent)
//            .disabled((self.flag1 == false) && (self.flag2 == false) ? false : true)
//            
//            Text("덧셈: \(self.add)")
//                .padding(10)
//            Text("뺄셈: \(self.sub)")
//                .padding(10)
//            Text("곱셈: \(self.mul)")
//                .padding(10)
//            Text("나눗셈: \(self.div)")
//                .padding(10)
//        }
//    }
//}
//
#Preview {
    CalcView().padding(10)
}
