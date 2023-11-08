//
//  NavigationSplitViewEx02.swift
//  Ch33_NavSplitDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct Item02: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}

struct ListView: View {
    var items: [Item02]
    @Binding var selection: Item02?

    var body: some View {
        List(items, id: \.self, selection: $selection) { item in
            Text(item.title)
        }
    }
}

struct DetailView: View {
    var item: Item02

    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
            Text(item.content)
                .padding()
        }
    }
}

struct NavigationSplitViewEx02: View {
    // 샘플 데이터
    var items = [
        Item02(title: "첫 번째 항목", content: "이것은 첫 번째 항목입니다."),
        Item02(title: "두 번째 항목", content: "이것은 두 번째 항목입니다."),
        Item02(title: "세 번째 항목", content: "이것은 세 번째 항목입니다."),
        Item02(title: "네 번째 항목", content: "이것은 네 번째 항목입니다."),
        Item02(title: "다섯 번째 항목", content: "이것은 다섯 번째 항목입니다."),
        Item02(title: "여섯 번째 항목", content: "이것은 여섯 번째 항목입니다."),
        Item02(title: "일곱 번째 항목", content: "이것은 일곱 번째 항목입니다."),
        Item02(title: "여덟 번째 항목", content: "이것은 여덟 번째 항목입니다."),
        Item02(title: "아홉 번째 항목", content: "이것은 아홉 번째 항목입니다."),
        Item02(title: "열 번째 항목", content: "이것은 열 번째 항목입니다.")
    ]

    @State private var selectedItem: Item02?

    var body: some View {
        NavigationSplitView {
            ListView(items: items, selection: $selectedItem)
        } detail: {
            if let selectedItem {
                DetailView(item: selectedItem)
            } else {
                Text("Select a item")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}


#Preview {
    NavigationSplitViewEx02()
}
