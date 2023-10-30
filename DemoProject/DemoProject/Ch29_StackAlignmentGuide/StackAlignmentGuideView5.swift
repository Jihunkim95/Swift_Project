//
//  StackAlignmentGuideView5.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/30.
//

import SwiftUI
extension Image {
    func squareImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

extension Button {
    func lionButtonModifier() -> some View {
        self
            .padding(5)
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(5)
    }
}

struct StackAlignmentGuideView5: View {

    @State private var icup = "square.and.arrow.up"
    @State private var icdown = "square.and.arrow.down"

    var body: some View {
        VStack {
            Image(systemName: icup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Spacer()

            HStack {
                Spacer()

                Button("UP") {
                    // down 이미지 일때 위치 바꾸기
                    if icup.hasSuffix("down") { (icup, icdown) = (icdown, icup) }
                }
                .lionButtonModifier()

                Spacer()

                Button("DOWN") {
                    // up 이미지 일때 위치 바꾸기
                    if icup.hasSuffix("up") { (icup, icdown) = (icdown, icup) }
                }
                .lionButtonModifier()

                Spacer()
            }

            Spacer()
            Image(systemName: icdown)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
    }
}

#Preview {
    StackAlignmentGuideView5()
}
