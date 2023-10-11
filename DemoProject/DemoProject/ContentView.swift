//
//  ContentView.swift
//  DemoProject

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                Text("목록")
                List{
                    NavigationLink(destination: CalcView()){
                        Text("GoTo CalcView")
                    }.padding()
                    
                    NavigationLink(destination: DivideOrangeView()){
                        Text("GoTo DivideOrangeView")
                    }.padding()
                    
                    NavigationLink(destination: FormatView()){
                        Text("GoTo FormatView")
                    }.padding()
                    
                    NavigationLink(destination: ios_01_SwiftEx04_View()){
                        Text("GoTo ios_01_SwiftEx04_View")
                    }.padding()
                    
                    NavigationLink(destination: ios_01_SwiftEx05_View()){
                        Text("GoTo ios_01_SwiftEx05_View")
                    }.padding()
                    
                    NavigationLink(destination: ios_01_SwiftEx06_View()){
                        Text("GoTo ios_01_SwiftEx06_View")
                    }.padding()
                    NavigationLink(destination: ios_01_SwiftEx07_View()){
                        Text("GoTo ios_01_SwiftEx07_View")
                    }.padding()
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
//
//  Created by 김지훈 on 2023/10/10.
//
