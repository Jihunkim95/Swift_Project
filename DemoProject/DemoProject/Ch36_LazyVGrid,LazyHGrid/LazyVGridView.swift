//
//  LazyVGrid.swift
//  DemoProject
//
//  Created by 김지훈 on 2023/11/08.
//

import SwiftUI

struct LazyVGridView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
//    // 적응형 GridItem 설정 : 열너비가 50 미만으로 될 수 없다
//    private var gridItems = [GridItem(.adaptive(minimum:50))]
    
//    // 고정형 GridItem 설정 : 열너비가 100인 단일 그리드
//    private var gridItems = [GridItem(.fixed(100))]
    
    // 고정형과 적응형 조합
    private var gridItems = [GridItem(.fixed(100)),GridItem(.adaptive(minimum: 100))]


    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: gridItems,spacing: 5){
                ForEach((0...50),id:\.self){ index in
                    CellContent(index: index, color: colors[index % colors.count])
                    
                }
            }
            .padding(5)
        }
        
    }
}
// 셀 동작하는 커스텀 뷰를 추가 p.367
struct CellContent: View {
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
    LazyVGridView()
}
