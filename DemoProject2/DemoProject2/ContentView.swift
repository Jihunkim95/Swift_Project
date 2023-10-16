//
//  ContentView.swift
//  DemoProject2
//
//  Created by 김지훈 on 2023/10/11.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let speedsetting = SpeedSetting()
    
    var body: some View {
        VStack{
            NavigationView{
                List{
                    //화면 점프
                    NavigationLink(destination: BasicView()){
                        Text("Next Screen")}
                    NavigationLink(destination: StackFrameView()){
                        Text("스택")}
                    NavigationLink(destination: StateView()){
                        Text("Ch20.상태 프로퍼티")}
                    
                    
                }
                
            }
            
            
            VStack{
                Text("--Environment프로퍼티가 어떻게 작동되는지--")
                SpeedControlView()
                SpeedDisplayView()
            }.environmentObject(speedsetting)
            
            
        }
    }
    
}

#Preview {
    ContentView()
}
