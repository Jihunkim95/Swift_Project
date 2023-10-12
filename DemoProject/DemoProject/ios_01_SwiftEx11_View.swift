//
//  ios_01_SwiftEx11_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/12.
//

import SwiftUI

struct ios_01_SwiftEx11_View: View {
    @State var input:Int = 0
    @State var result:Int = 0
    var body: some View {
        VStack{
            // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
            Label("농구공", systemImage: "basketball.fill").font(.system(size: 30)).background(Color.yellow)

            HStack{
            
                Text("농구공의 개수를 입력하세요.").fontWeight(.bold)
                
                TextField("", value: $input,format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Enter", action: Divide).padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            }.padding(.horizontal,50)

            Text("필요한 상자 수  : \(result)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: 270,alignment: .leading)

        }
    }
    func Divide(){
        if input%5 == 0{
            result = input/5
        }else{
            result = input/5 + 1
        }
            

    }
}

#Preview {
    ios_01_SwiftEx11_View()
}
