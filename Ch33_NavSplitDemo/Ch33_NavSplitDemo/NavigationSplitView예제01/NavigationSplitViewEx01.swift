//
//  NavigationSplitViewEx01.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI
/*
NavigationSplitView 예제 01
 
NavigationSplitView를 사용하여 iPad에서 가로 방향으로 화면을 분할하고, 왼쪽에는 목록 뷰, 오른쪽에는 선택한 항목의 세부 정보를 표시하는 앱을 만드세요.
 */
struct ItemEx01: Identifiable,Hashable {
    var id = UUID()
    var name: String
    var detail: String
}


struct NavigationSplitViewEx01: View {
     var items = [
            ItemEx01(name: "Apple", detail: "학명 말루스 도메스티카(Malus domestica)는 라틴어로 '친숙한 사과'란 뜻"),
            ItemEx01(name: "Banana", detail: "바나나(영어: Banana, 문화어: 빠나나)는 파초과 파초속의 여러해살이 식물과 열매를 두루 일컫는 말"),
            ItemEx01(name: "Cherry", detail: "벚나무의 열매. 순우리말로는 버찌라고 한다. 다만 보통 한국에서 접하는 사진의 서양버찌는 체리라 부르고 동양버찌는 버찌라고 별개로 부르는 편이 많다")
        ]

    @State private var selectedItem: ItemEx01?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    @State private var selectedDetail: String?
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility){
            List(items, selection: $selectedItem){ item in
                Text(item.name).tag(item)
                
            }
        }detail: {
            if let selectedItem {
                Text("\(selectedItem.detail)")
            }else{
                Text("dd")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViewEx01()
}
