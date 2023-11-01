//
//  NavigationQuizView3.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/01.
//

import SwiftUI

struct NavigationQuizView3: View {
    @State var data = "Hello"
    var body: some View {
        NavigationStack {
            VStack {
                Text(data)
                NavigationLink(destination: SecondViewEx3(data: $data), label: {Text("Go...")})
            }
        }
    }
}
struct SecondViewEx3: View {

    @Binding var data: String

    var body: some View {
            VStack {
                Spacer()
                Text(data)
                TextField("여기에 입력", text: $data)
                Spacer()
            }
            //요거
            .background(.blue)
            .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    NavigationQuizView3()
}
