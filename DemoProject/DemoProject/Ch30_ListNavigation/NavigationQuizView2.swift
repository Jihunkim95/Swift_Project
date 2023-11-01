//
//  NavigationQuizView2.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI
/*
 Navigation 예제 02
 SwiftUI에서 NavigationStack을 사용하여

 첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면에 전달된 데이터를 표시하고,

 두 번째 화면에서 데이터를 수정할 수 있도록 하는 코드를 작성하세요.

 단, 수정된 데이터는 첫 번째 화면에도 반영되어야 합니다.
 */

struct NavigationQuizView2: View {
    @State public var navTitle: String = "First View"
    var body: some View {
        NavigationStack {
            NavigationLink("Go to second view \(Image(systemName: "arrow.right"))") {
                SecondViewEx2(firstNavTitle: $navTitle)
            }
            .navigationTitle("\(navTitle)")
        }
        
    }
}

struct SecondViewEx2: View {
    @Binding var firstNavTitle: String
    var body: some View {
        NavigationStack {
            TextField("First View's Title", text: $firstNavTitle)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}
#Preview {
    NavigationQuizView2()
}
