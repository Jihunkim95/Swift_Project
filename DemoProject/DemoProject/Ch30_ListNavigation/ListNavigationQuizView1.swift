//
//  ListNavigationQuizView1.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

/*
 SwiftUI List 예제 01
 List 를 사용하여 다음과 같은 화면을 구현해보세요.

 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트가 있습니다.
 List 의 배경색은 흰색이고, 텍스트의 색은 파란색입니다.
 */
import SwiftUI

struct QuizItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ListNavigationQuizView1: View {
    @State var listData: [QuizItem] = [
            QuizItem(task: "item1", imageName: "1.circle.fill"),
            QuizItem(task: "item1", imageName: "2.circle.fill"),
            QuizItem(task: "item1", imageName: "3.circle.fill"),
            QuizItem(task: "item4", imageName: "4.circle.fill"),
            QuizItem(task: "item5", imageName: "5.circle.fill"),
    ]
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        // 여기에 코드를 작성하세요.
        List{
            ForEach(listData){ item in
                NavigationLink(value: item.task){
                    HStack{
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
                .foregroundColor(.green)
                .listRowBackground(Color.white)
            }
        }

    }
}

#Preview {
    ListNavigationQuizView1()
}
