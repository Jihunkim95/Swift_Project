//
//  LifecycleDemo.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/10/26.
//

import SwiftUI

struct LifecycleDemo: View {
    
    var body: some View {
        
        TabView{
            FirstTabView().tabItem{
                Image(systemName: "01.circle")
                Text("First")
            }
            SecondTabView().tabItem{
                Image(systemName: "02.circle")
                Text("Second")
            }
        }
        
    }
}

#Preview {
    LifecycleDemo()
}
