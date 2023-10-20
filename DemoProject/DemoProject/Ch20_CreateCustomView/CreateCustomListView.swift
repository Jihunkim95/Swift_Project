//
//  CreateCustomListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/20.
//

import SwiftUI

struct CreateCustomListView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Ch20 커스텀뷰")
                List{
                    NavigationLink(destination: CreateCustomView()){
                        Text("시급 계산기")
                    }.padding()
                    
                    NavigationLink(destination: CreateCustomView2()){
                        Text("초를 시,분,초 변환")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    CreateCustomListView()
}
