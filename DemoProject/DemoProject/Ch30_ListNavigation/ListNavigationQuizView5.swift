//
//  ListNavigationQuizView5.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 SwiftUI List 예제 05
 List 를 사용하여 다음과 같은 화면을 구현해보세요.
 
 화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
 List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 삭제 버튼이 있습니다.
 삭제 버튼을 탭하면 해당 행이 삭제되고, 나머지 행들이 재정렬됩니다.
 */


struct ListNavigationQuizView5: View {
    
    @State private var items = Array(1...10)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("item \(String(item))")
                }
                .onDelete(perform: removeList)
                .onMove(perform: moveList)
            }
            .navigationTitle("SwiftUI List Quiz")
            //navigationBarItems 곧 사라짐 .toolbar를 사용하자
            .toolbar{EditButton()}
        }
    }
    
    
    func removeList(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    func moveList(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ListNavigationQuizView5()
}
