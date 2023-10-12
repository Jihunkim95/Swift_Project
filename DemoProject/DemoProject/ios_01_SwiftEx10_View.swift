//
//  ios_01_SwiftEx10_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/12.
//

import SwiftUI

struct ios_01_SwiftEx10_View: View {
    @State var inputA:Int = 0
    @State var inputB:Int = 0
    @State var result:Int = 0
    var body: some View {
        VStack(alignment:.leading, spacing: 10 ){
            HStack{
                Text("첫번째 정수: ")
                TextField("", value: $inputA,format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("두번째 정수: ")
                TextField("", value: $inputB,format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Enter", action: AMinusB).padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }
            Text("결과: \(result)")
        }
        
    }
    func AMinusB(){
        result = inputA-inputB
    }

}

#Preview {
    ios_01_SwiftEx10_View()
}
