//
//  ListNavigationQuizView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 SwiftUI List 예제 02
 List 를 사용하여 다음과 같은 화면을 구현해보세요.
 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 5개의 섹션이 있으며, 각 섹션에는 "Section 1", "Section 2", ... , "Section 5" 라는 헤더가 있습니다.
 각 섹션에는 3개의 행이 있으며, 각 행에는 "Row 1", "Row 2", "Row 3" 이라는 텍스트가 있습니다.
 List 의 배경색은 회색이고, 헤더의 텍스트 색은 검은색, 행의 텍스트색은 파란색입니다.
 */
struct ListNavigationQuizView2: View {
    let sectionData = ["Section 1", "Section 2", "Section 3","Section 4","Section 5"]
    
    @State var listData: [QuizItem] = [
        QuizItem(task: "Row1", imageName: "1.circle.fill"),
        QuizItem(task: "Row2", imageName: "2.circle.fill"),
        QuizItem(task: "Row3", imageName: "3.circle.fill")
    ]
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List{

            // Section 1 ~ 5 번 돌림
            ForEach(sectionData, id: \.self){ sectionItem in
                Section(header: Text(sectionItem)) {
                    // listData 1 ~ 3번 돌림
                    ForEach(listData){ item in
                        NavigationLink(value: item.task){
                            HStack{
                                Image(systemName: item.imageName)
                                Text(item.task)
                                .foregroundStyle(Color.blue)
                            }
                        }
                    }.listRowBackground(Color.gray)
                }
            }
            
        }
    }
}

#Preview {
    ListNavigationQuizView2()
}
