//
//  AppStroageSceneStorageListView.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct AppStroageSceneStorageListView: View {
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink(destination: AppStroageSceneStorageContentView()){
                        Text("ContentView")
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    AppStroageSceneStorageListView()
}
