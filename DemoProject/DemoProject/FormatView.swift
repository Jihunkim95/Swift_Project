//
//  FormatView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/10.
//

import SwiftUI

struct FormatView: View {
    @State private var input:Int = 0
    @State private var result:Int = 0
    var body: some View {
        
        VStack{
            Text("백의 자리 이하를 버리는 앱")
            TextField("A숫자", value: $input, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("계산", action: Format)
            
            Text("결과 : \(result)")
        }

    }
    func Format(){
        result = input/100 * 100 

    }
}

#Preview {
    FormatView()
}

