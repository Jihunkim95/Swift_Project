//
//  ios_01-Ch22_Ex01View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/16.
//

import SwiftUI

struct ios_01_Ch22_Ex01View: View {
    @State private var text: String = "Hello World"
    var body: some View {
        //1.이미지 영역
        //2.Home,Text, CALL영역
        //3.TextField, Button영역
        //... 보라색은 같기에 modifiler을 사용하여 코드 재사용성을 높이자.
        VStack{
            ZStack{
                Color(red: 81 / 255, green: 82 / 255, blue: 64 / 255).ignoresSafeArea()
                VStack{
                    Divider()
                    Divider()
                    Image("살색").resizable().frame(width: 350,height: 200).cornerRadius(20)
                    
                    HStack{
                        Link(destination: URL(string: "https://www.apple.com")!, label: {Text("Home").modifier(StandardButton())
                        })
                                            
                        Text(text).frame(width: 190)
                        
                        Button("CALL"){
                            let numberString = "01011112222"
                            let telephone = "tel://"
                            let formattedString = telephone + numberString
                            
                            guard let url = URL(string: formattedString) else {
                                return
                            }
                        }.modifier(StandardButton())

                    }.padding(5)

                    Spacer()
//                    Button("Enter")
                    HStack{
                        TextField("", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("HELLO BUTTON"){
                        }.modifier(StandardButton())
                    }.padding()
                }
            }
        }
    }
}

struct StandardButton: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding()
             .frame(height: 35)
             .background(Color.purple)
             .foregroundColor(.white)
             .font(.system(size: 15))
             .cornerRadius(10)

    }
}
#Preview {
    ios_01_Ch22_Ex01View()
}
