//
//  ContentView.swift
//  DemoProject2
//
//  Created by 김지훈 on 2023/10/11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            
            VStack{
                //화면 점프
                NavigationLink(destination: BasicView()){
                    Text("Next Screen")
                }
            }
            .padding(100)
            .background(Color.indigo)
        }
    }

}

#Preview {
    ContentView()
}
