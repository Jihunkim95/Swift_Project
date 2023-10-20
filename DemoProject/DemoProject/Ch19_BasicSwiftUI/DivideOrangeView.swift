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
            
            Text("귤을 박스에 나누어 담는 계산기").font(.system(size: 50))
                .fontWeight(.bold)
                .frame(minWidth: 350, alignment: .leading)
            Spacer()
            VStack{
                HStack{
                    Text("귤").font(.system(size: 20)).frame(width: 30, height: 30)
                    TextField("A숫자", value: $inputA, format: .number)        .textFieldStyle(.roundedBorder) .frame(width: 100, height: 30)
                        .padding(.vertical,20)
                    
                    HStack{
                        Text("한 박스").font(.system(size: 20)).frame(width: 60, height: 30)
                        TextField("B숫자", value: $inputB, format: .number).frame(width: 50, height: 30)
                            .textFieldStyle(.roundedBorder)
                        Button(action: {Divide(); Remain();}){
                            Text("Enter").frame(width: 80, height: 30).padding(2)
                                .background(Color.black)
                                .foregroundColor(Color.white)
                                .cornerRadius(10) // 테두리 둥글기 설정
                        }
                    }.padding(1)
                }.padding(1)
                
                VStack(alignment: .leading){
                    Text("귤 박스 갯수: \(resultA)")
                    Text("남은 귤 수: \(resultB)")
                }.offset(x:-123,y: -10) // 원하는 만큼 위로 이동
                
            }.offset(y: -60)
            
            
            
        }.padding(.horizontal,10).background(Image("OrangeBackground").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)) // 배경이미지 딱 맞게
        
        
    }
    func Divide(){resultA = inputA / inputB}
    func Remain(){resultB = inputA % inputB}
    
}

#Preview {
    DivideOrangeView().padding(10)
}



