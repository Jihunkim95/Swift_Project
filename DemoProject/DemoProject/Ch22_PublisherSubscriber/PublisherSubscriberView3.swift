//
//  ios_01-Ch22_Ex03View.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/16.
//

import SwiftUI

struct PublisherSubscriberView3: View {
    var body: some View {
        
        GeometryReader { geometry in
            VStack {

                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)

                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 4 * 3)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)

                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
        }
    }
}

#Preview {
    PublisherSubscriberView3()
}
