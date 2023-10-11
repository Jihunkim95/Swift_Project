//
//  BasicView.swift
//  DemoProject2
//
//  Created by 김지훈 on 2023/10/11.
//

import SwiftUI

struct BasicView: View {
    @ObservedObject var num = NumberOnly()
    
    @State private var score:Int = 0
    @State private var input:Int = 0
    @State private var msg:String = "메세지왔다"
    @State private var result:String = "Hello, world"
    
    //프로퍼티로서의 뷰
    let carStack = HStack{
        Text("Car Image")
            .font(.headline)
            .foregroundColor(.red)
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        
        VStack{
            carStack
            Image(systemName: "square.and.arrow.up")
                .resizable()//꽉차게
                .aspectRatio(contentMode: .fit)
                .imageScale(.large)
                .foregroundStyle(.tint)
            

            //커스텀 수정자
            Text("\(msg)")
                .foregroundColor(Color.white)
                .padding() //수정자 순서 주의
                .border(Color.white)
                .modifier(StandardTitle())
            // 숫자 입력
            HStack{
                TextField("Score", value: $score, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                TextField("Number", text: $num.value)
                    .textContentType(.creditCardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            HStack{
                TextField("A숫자", value: $input, format: .number).textFieldStyle(RoundedBorderTextFieldStyle())
                Button("누르면 변함", action: btnPressed).foregroundColor(.black) .frame(width: 100, height: 30).border(Color.white)
            }
            
            Text("\(result)")
                .foregroundColor(Color.white)
                .padding() //수정자 순서 주의
                .border(Color.white)

            //하위뷰
            VStack{
                MyHStackView()
            }
            
            //커스텀 컨테이너 뷰
            MyVStack{
                Text("Hello")
                Text("World")
            }
            
            // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
            Label("Welcome", systemImage: "person.circle")
                .font(.largeTitle)
        }
        .padding(100)
        .background(Color.indigo)

    }
    func btnPressed(){
        result = "Hello222222"
    }


}
//하위뷰
struct MyHStackView: View {
    var body: some View{
        HStack{
            Text("Text 3")
            Text("Text 4")
        }
    }
}

// 커스텀 수정자(공통된 수정사항)
struct StandardTitle: ViewModifier{
    func body(content: Content) -> some View {
        content // 뷰안에 내부에 들어오는 내용을 content라고 한다
            .font(.largeTitle)
            .background(Color.gray)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }

}

// 커스텀 컨테이너 뷰, ViewBuillder 속성을 사용
struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping() -> Content){
        self.content = content
    }
    var body: some View{
        VStack(spacing:10){
            content()
        }
    }
}
// 숫자만 강제
class NumberOnly: ObservableObject {
    @Published var value = "" {
        didSet{
            let fillered = value.filter{$0.isNumber}
            if value != fillered{
                value = fillered    
            }
        }
    }
}
#Preview {
    BasicView()
}
