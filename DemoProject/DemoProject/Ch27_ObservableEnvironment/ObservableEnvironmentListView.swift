//
//  ObservableEnvironmentListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct ObservableEnvironmentListView: View {
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink(destination: ObservableEnvironmentView()){
                        Text("Observable을 이용한 시간뷰")
                    }.padding()
                }
            }
        }
        
    }
}

#Preview {
    ObservableEnvironmentListView()
}
