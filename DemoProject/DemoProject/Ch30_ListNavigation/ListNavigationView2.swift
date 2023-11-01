//
//  ListNavigationView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/31.
//

import SwiftUI
// 동적 리스트
// - 리스트에 표시할 데이터는 Identifiable 프로토콜을 따라야 한다.
// - id 프로퍼티 필수 : 각 항목을 고유하게 식별하는데 사용
// - Hashable 프로토콜을 따르는 모든 스위프트 타입이나 커스텀 타입이 가능
// - UUID() 메서드는 각 항목마다 고유한 ID를 자동으로 생성하는데 사용

struct ToDoItem : Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct ListNavigationView2: View {
    //리스트에 데이터 제종
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]

    //정적 항목인 토글 버튼과 동적 데이터에 대한 ForEach 구문 사용
    @State private var toggleStatus = true
    
    var body: some View {

        NavigationStack{
            
            List{
                Section(header: Text("Settings")){
                    Toggle(isOn: $toggleStatus){
                        Text("Allow Notifications")
                    }
                }
                
                Section(header: Text("To Do Tasks")){
                    ForEach(listData){ item in
                        NavigationLink(value: item.task){
                            HStack{
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    
                }
            }
            // 새로고침하면 데이터 바뀜
            .refreshable {
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the Kids", imageName: "person.2.fill")
                ]
            }
        }
        
        //동적 리스트로 변경 가능함
        List(listData){ item in
            HStack{
                Image(systemName: item.imageName)
                Text(item.task)
            }
        }
    }
}

#Preview {
    ListNavigationView2()
}
