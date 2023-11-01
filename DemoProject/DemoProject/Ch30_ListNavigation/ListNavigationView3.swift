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
//struct ToDoItem : Identifiable {
//    var id = UUID()
//    var task: String
//    var imageName: String
//}

struct ListNavigationView3: View {
    //리스트에 데이터 제종
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    //p307, 30.7 내비게이션 경로로 작업하기
    @State private var stackPath = NavigationPath()

    //정적 항목인 토글 버튼과 동적 데이터에 대한 ForEach 구문 사용
    @State private var toggleStatus = true
    
    var body: some View {
        
        //30.7 경로 카운트
        Text("\(stackPath.count)")

        NavigationStack(path: $stackPath){
            
            List{
                Section(header: Text("Settings")){
                    Toggle(isOn: $toggleStatus){
                        Text("Allow Notifications")
                    }
                }
                // 30.6 값 타입별 내비게이션
                NavigationLink(value: listData.count){
                    Text("View Task Count")
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
                    .onDelete(perform: { indexSet in
                        // 데이터 소스에서 항목을 삭제하는 코드 p.310
                    })
                    .onMove(perform: { indices, newOffset in
                        // 항목을 재배열하는 코드 p.311
                        print("onMove")
                    })
                    
                }
            }
            //호출의 후행 클로저 내에서는 행이 선택될때 표시 될 뷰를 호출
            .navigationDestination(for: String.self){ task in
                Text("Selected task = \(task)")
            }
            // 30.6 값 타입별 내비게이션
            .navigationDestination(for: Int.self){ count in
                Text("Number of tasks = \(count)")
            }
            //p308 네비게이션 바 커스터마이징
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: Button(action: { print("press navi button") }, label: {Text("Hello")}))
        }

    }
}

#Preview {
    ListNavigationView3()
}
