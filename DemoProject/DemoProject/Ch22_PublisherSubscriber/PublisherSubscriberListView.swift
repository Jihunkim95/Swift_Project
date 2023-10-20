//
//  PublisherSubscriberListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct PublisherSubscriberListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ch22 \n상태 프로퍼티, Observable, Sate, Evironment객체 ")
                List{
                    NavigationLink(destination: PublisherSubscriberView()){
                        Text("Link, URL 활용 예시")
                    }.padding()
                    
                    NavigationLink(destination: PublisherSubscriberView2()){
                        Text("GeometryReader 활용 예시1")
                    }.padding()
                    
                    NavigationLink(destination: PublisherSubscriberView3()){
                        Text("GeometryReader 활용 예시2")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    PublisherSubscriberListView()
}
