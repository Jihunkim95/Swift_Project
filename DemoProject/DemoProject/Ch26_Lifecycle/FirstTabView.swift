//
//  FirstTabView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            //
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
    }
}

#Preview {
    FirstTabView()
}
