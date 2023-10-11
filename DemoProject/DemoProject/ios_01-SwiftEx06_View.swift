//
//  ios_01-SwiftEx06_View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/11.
//

import SwiftUI

struct ios_01_SwiftEx06_View: View {
    @State private var input:Int = 0
    
    @State private var hour:Int = 0
    @State private var min:Int = 0
    @State private var sec:Int = 0
    
    var body: some View {
        
        VStack{
            MyClockStackView()
            
            Text("초를 입력받아[시,분,초]형태로 출력하는 앱")
            
            HStack{
                Text("초입력")
                TextField("", value: $input ,format:.number).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 140,height:20)
                Button("Enter", action: {Hour();Min();Sec();}).frame(width: 50,height: 40).border(Color.white, width: 2)
            }.padding(10)
            
            HStack{
                
                Text("\(hour)").modifier(TitleTextStyle())
                Text("시")
                Text("\(min)").modifier(TitleTextStyle())

                Text("분")
                
                Text("\(sec)").modifier(TitleTextStyle())

                Text("초")
            }.padding(10)
            
        }.padding(20).background(RoundedRectangle(cornerRadius:20).fill(Color.green))
            


    }
    func Hour(){
        hour = input/(60*60)
    }

    func Min(){
        min = (input - hour*3600)/60
    }
    
    func Sec(){
        sec = input%60
    }
}

struct MyClockStackView: View {
    var body: some View {
        HStack{
            Image(systemName: "clock.badge.checkmark")
                .resizable() // 이미지 크기를 조절 가능하도록 설정
                .frame(width: 100, height: 100) // 원하는 크기로 설정
                .scaledToFit() // 이미지가 프레임 내에 맞도록 조절
        }
    }
}

struct TitleTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
          .frame(width: 50, height: 40)
          .background(Color.white) // 배경색을 흰색으로 설정
          .foregroundColor(Color.black) // 글자색을 검정색으로 설정
  }
}


#Preview {
    ios_01_SwiftEx06_View()
}
