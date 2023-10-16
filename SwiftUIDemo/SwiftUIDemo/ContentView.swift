//
//  ContentView.swift
//  SwiftUIDemo
//  Ch23.SwiftUI 예제 튜토리얼
//  Picker, rotationEffect,
//  Created by 김지훈 on 2023/10/13.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black,.red,.green,.blue]
    var colornames = ["Black","Red","Green","Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"

    var body: some View {
        Picker(selection: $colorIndex, label: Text("Color")) {
            ForEach(0 ..< colornames.count,id: \.self){
                Text(colornames[$0])
                    .foregroundColor(colors[$0])
            }
        }.pickerStyle(.wheel)
         .padding()
        
        VStack {
            Spacer()
            
            Text(text).font(.largeTitle).fontWeight(.semibold).rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5),value: rotation)
                .foregroundColor(colors[colorIndex])
            

            Slider(value: $rotation, in: 0 ... 360, step: 0.1)

            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(.none)
            Spacer()
            // 레이블 뷰, 아이콘과 텍스트가 나란히 배치
            List{
                Label("basketball", systemImage: "basketball.fill")
                Label("tennisball", systemImage: "tennisball.circle")
                Label("skateboard.fill", systemImage: "skateboard.fill")
            }
            
            Divider()
            
        }
    }
}

#Preview {
    ContentView()
}
