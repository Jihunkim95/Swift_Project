//
//  ContentView.swift
//  OutlineGroupDemo
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

//샘플 데이터 구조 p.355
struct CarInfo: Identifiable {
    var id = UUID()         // instence identify
    var name: String        // 자동차 타입, 제조사, 모델 이름 등
    var image: String       // 표시될 심볼 이미지
    var children: [CarInfo]? // 계층형 구조를 위한것 carItems에서 3단계로 쓰임
}
// 샘플 데이터 준비 p.356
let carItems: [CarInfo] = [
    
    CarInfo(name: "Hybrid Cars", image: "leaf.fill", children: [
        CarInfo(name: "Toyota", image: "car.circle", children : [
            CarInfo(name: "Prius", image: "leaf.fill"),
            CarInfo(name: "Highlander Hybrid", image: "leaf.fill"),
            CarInfo(name: "Lexus", image: "car.circle", children: [
                CarInfo(name: "Lexus RX", image: "leaf.fill"),
                CarInfo(name: "Lexus NX", image: "leaf.fill")])
        ]),
        CarInfo(name: "Ford", image: "car.circle", children : [
            CarInfo(name: "Fusion Energi", image: "leaf.fill"),
            CarInfo(name: "Escape", image: "leaf.fill"),
            CarInfo(name: "Volvo", image: "car.circle", children: [
                CarInfo(name: "S90 Hybrid", image: "leaf.fill"),
                CarInfo(name: "XC90 Hybrid", image: "leaf.fill")])
        ]),
    ]),
    
    CarInfo(name: "Electric Cars", image: "bolt.car.fill", children: [
        CarInfo(name: "Tesla", image: "car.circle", children : [
            CarInfo(name: "Model 3", image: "bolt.car.fill")
        ]),
        CarInfo(name: "Karma", image: "car.circle", children : [
            CarInfo(name: "Revero GT", image: "bolt.car.fill")
        ])
    ])
]

struct ContentView: View {
    var body: some View {
        List {
            ForEach(carItems) { carItem in
                Section(header: Text(carItem.name)){
                    // 데이터를 화면에 표현하는 것에 더 큰 제어 기능을 제공
                    // Section으로 구분하여 표시
                    // List 뷰에 포함하면 시각적으로 만족스러움
                    OutlineGroup (carItem.children ?? [CarInfo](),children: \.children){
                        child in
                        
                        CellView(item: child)
                    } // end OutlineGroup
                }
            }
        }
        .listStyle(.grouped)
    }
}
// 각 list Cell에 표시할 CustomView를 Design
struct CellView: View {
    var item: CarInfo
    var body: some View{
        HStack{
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundStyle(.green)
            
            Text(item.name)
                .font(.system(.title3,design: .rounded))
        }
    }
}
#Preview {
    ContentView()
}
