//
//  ConcurrencyListView4.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct ConcurrencyView4: View {
    @State private var text:String = "Hi"
    @State private var a:Int = 0
    @State private var b:Int = 0
    @State private var result:Int = 0
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("\(text)")
            TextField("", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            HStack(spacing: 30 ){
                TextField("num 1", value: $a, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                Text("~")
                TextField("num 2", value: $b, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType (.decimalPad)
                .foregroundColor (.black)
                .multilineTextAlignment (.center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                
            }
            
            Button("Enter", action: {sumFrom(a,b)}).frame(width: 50,height: 40).border(Color.white, width: 2)
            Text("\(result)")
        }
    }
    @discardableResult
    func sumFrom(_ start:Int,_ end:Int)->Int{
        for i in start...end{
            result += i
        }
        return result
    }
}

#Preview {
    ConcurrencyView4()
}
