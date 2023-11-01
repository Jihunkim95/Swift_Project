//
//  MutiSecectionView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI

struct MutiSecectionView: View {
    struct Item: Identifiable {
        let id = UUID()
        let image: String
        let text: String
    }

    let items = [
        Item(image: "appplelogo", text: "Apple"),
        Item(image: "swift", text: "Swift"),
        Item(image: "xcode", text: "Xcode"),
        Item(image: "macos", text: "macOS"),
        Item(image: "ios", text: "iOS")
    ]

    //List(items, selection: $multiSelection)
    //Set<UUID>() 타입이 item들을 저장해줌
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        Text("\(multiSelection.count) selections")
            .font(.largeTitle)
            .padding()

        NavigationStack {

            List(items, selection: $multiSelection) { item in
                HStack {
                    Text("Item \(item.text)")
                }
            }
            .navigationTitle("SwiftUI List Quiz")
            .toolbar { EditButton() }

        }
    }
}

#Preview {
    MutiSecectionView()
}
