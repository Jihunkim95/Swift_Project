//
//  GridViewEx01.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct GridViewEx01: View {
    //sliderValue:Double 생략가능
    @State private var sliderValue = 1.0
    var body: some View {
        let gridItems =  Array(repeating: GridItem(.fixed(50)), count: Int(sliderValue))
        
        Slider(value: $sliderValue, in: 1...5, step: 1)
        Text("\(Int(sliderValue))")
        
        Spacer()
        
        LazyVGrid(columns: gridItems, spacing: 5){
            //Slider(value)값이 커지면 GridItem도 함께 증가
            ForEach((0..<Int(sliderValue*sliderValue)), id: \.self){ index in
                
                CellContentEx01(index: index + 1, color: .green )
                
            }
        }
        Spacer()
    }
}

struct CellContentEx01: View {
    var index: Int
    var color: Color
    
    var body: some View{
        Text("\(index)")
            .frame(minWidth: 40, minHeight: 40, maxHeight: .infinity)
            .background(color)
            .cornerRadius(8)
            .font(.largeTitle)
    }
}
#Preview {
    GridViewEx01()
}
