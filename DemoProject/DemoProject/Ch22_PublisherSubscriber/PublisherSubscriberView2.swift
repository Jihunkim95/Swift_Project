//
//  ios_01-Ch22_Ex02View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/16.
//

import SwiftUI

struct PublisherSubscriberView2: View {
    @State private var count: Int = 0
    var body: some View {
        //비율을 사용하여 화면 전체를 채운다
        GeometryReader(content: { geometry in
            VStack{
                Spacer()
                Text("Hello World")
                Text("\(count)")
                Spacer()
                Button(action: {count += 1 },label: {Text("Count")})
                    .frame(width: geometry.size.width)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.background(.teal)
        })
    }
}


#Preview {
    PublisherSubscriberView2()
}
