//
//  ios_01-SwiftEx07_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/11.
//

import SwiftUI

struct ios_01_SwiftEx07_View: View {
    
    @State private var input:Int = 0
    
    @State private var pay:Int = 0
    
    var body: some View {
        
        VStack{
            // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
            Label("U 시급 계산하는 앱", systemImage: "dollarsign.arrow.circlepath").font(.system(size: 30))
            
            HStack(alignment: .top){  // 좌측 정렬을 위해 .top을 사용
                Text("근무시간 입력")
                TextField("", value: $input, format: .number).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 140,height:20)
                Button("Enter", action:Pay).frame(width: 50,height: 40).border(Color.white, width: 2)
            }
            
            HStack(alignment: .top){
                Text("총 급여는")
                Text("\(pay)").frame(width: 100, height: 40)
                    .background(Color.white) // 배경색을 흰색으로 설정
                    .foregroundColor(Color.black) // 글자색을 검정색으로 설정
                Text("원 입니다.")
        
            }
                
        }.padding(50).background(RoundedRectangle(cornerRadius:50).fill(Color.green))

    }

    func Pay(){
        if input <= 8{
            pay = input*10000
        }else{
            pay = 80000 + (input-8)*10000*15/10
        }
        
    }

}

#Preview {
    ios_01_SwiftEx07_View()
}
