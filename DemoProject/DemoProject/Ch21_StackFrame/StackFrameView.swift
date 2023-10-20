//
//  ios_01-SwiftEx09_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/12.
//

import SwiftUI

struct StackFrame: View {
    @State var input:Int = 0
    @State var result:String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10 ){
            
            Spacer()
            
            VStack{
                // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
                Label("Number", systemImage: "number.square.fill").font(.system(size: 30)).background(Color.yellow)
                
                Spacer()
                
                Text("정수를 입력하세요").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: 270,alignment: .leading)
                
                HStack{
                    
                    TextField("", value: $input,format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: OddEven){
                        Text("Enter").padding()
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(10) // 테두리 둥글기 설정
                    }
                }.padding(.horizontal,50) //좌우 간격만 조절
                Spacer()
                
                Text("\(result)").font(.largeTitle)
                    .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 8).cornerRadius(15)
                
            }


        }
    }
    func OddEven(){
        if input%2 == 1{
            result = "홀수"
        }else{
            result = "짝수"
        }
    }
}

#Preview {
    StackFrame().padding(10)
}
